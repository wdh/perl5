package IPC::Open3;

use strict;
no strict 'refs'; # because users pass me bareword filehandles
our ($VERSION, @ISA, @EXPORT);

require Exporter;

use Carp;
use Symbol qw(gensym qualify);

$VERSION	= '1.17';
@ISA		= qw(Exporter);
@EXPORT		= qw(open3);

=head1 NAME

IPC::Open3 - open a process for reading, writing, and error handling using open3()

=head1 SYNOPSIS

    $pid = open3(\*CHLD_IN, \*CHLD_OUT, \*CHLD_ERR,
		    'some cmd and args', 'optarg', ...);

    my($wtr, $rdr, $err);
    use Symbol 'gensym'; $err = gensym;
    $pid = open3($wtr, $rdr, $err,
		    'some cmd and args', 'optarg', ...);

    waitpid( $pid, 0 );
    my $child_exit_status = $? >> 8;

=head1 DESCRIPTION

Extremely similar to open2(), open3() spawns the given $cmd and
connects CHLD_OUT for reading from the child, CHLD_IN for writing to
the child, and CHLD_ERR for errors.  If CHLD_ERR is false, or the
same file descriptor as CHLD_OUT, then STDOUT and STDERR of the child
are on the same filehandle (this means that an autovivified lexical
cannot be used for the STDERR filehandle, see SYNOPSIS).  The CHLD_IN
will have autoflush turned on.

If CHLD_IN begins with C<< <& >>, then CHLD_IN will be closed in the
parent, and the child will read from it directly.  If CHLD_OUT or
CHLD_ERR begins with C<< >& >>, then the child will send output
directly to that filehandle.  In both cases, there will be a dup(2)
instead of a pipe(2) made.

If either reader or writer is the null string, this will be replaced
by an autogenerated filehandle.  If so, you must pass a valid lvalue
in the parameter slot so it can be overwritten in the caller, or
an exception will be raised.

The filehandles may also be integers, in which case they are understood
as file descriptors.

open3() returns the process ID of the child process.  It doesn't return on
failure: it just raises an exception matching C</^open3:/>.  However,
C<exec> failures in the child (such as no such file or permission denied),
are just reported to CHLD_ERR under Windows and OS/2, as it is not possible
to trap them.

If the child process dies for any reason, the next write to CHLD_IN is
likely to generate a SIGPIPE in the parent, which is fatal by default.
So you may wish to handle this signal.

Note if you specify C<-> as the command, in an analogous fashion to
C<open(FOO, "-|")> the child process will just be the forked Perl
process rather than an external command.  This feature isn't yet
supported on Win32 platforms.

open3() does not wait for and reap the child process after it exits.
Except for short programs where it's acceptable to let the operating system
take care of this, you need to do this yourself.  This is normally as
simple as calling C<waitpid $pid, 0> when you're done with the process.
Failing to do this can result in an accumulation of defunct or "zombie"
processes.  See L<perlfunc/waitpid> for more information.

If you try to read from the child's stdout writer and their stderr
writer, you'll have problems with blocking, which means you'll want
to use select() or the IO::Select, which means you'd best use
sysread() instead of readline() for normal stuff.

This is very dangerous, as you may block forever.  It assumes it's
going to talk to something like B<bc>, both writing to it and reading
from it.  This is presumably safe because you "know" that commands
like B<bc> will read a line at a time and output a line at a time.
Programs like B<sort> that read their entire input stream first,
however, are quite apt to cause deadlock.

The big problem with this approach is that if you don't have control
over source code being run in the child process, you can't control
what it does with pipe buffering.  Thus you can't just open a pipe to
C<cat -v> and continually read and write a line from it.

=head1 See Also

=over 4

=item L<IPC::Open2>

Like Open3 but without STDERR capture.

=item L<IPC::Run>

This is a CPAN module that has better error handling and more facilities
than Open3.

=back

=head1 WARNING

The order of arguments differs from that of open2().

=cut

# &open3: Marc Horowitz <marc@mit.edu>
# derived mostly from &open2 by tom christiansen, <tchrist@convex.com>
# fixed for 5.001 by Ulrich Kunitz <kunitz@mai-koeln.com>
# ported to Win32 by Ron Schmidt, Merrill Lynch almost ended my career
# fixed for autovivving FHs, tchrist again
# allow fd numbers to be used, by Frank Tobin
# allow '-' as command (c.f. open "-|"), by Adam Spiers <perl@adamspiers.org>
#
# usage: $pid = open3('wtr', 'rdr', 'err' 'some cmd and args', 'optarg', ...);
#
# spawn the given $cmd and connect rdr for
# reading, wtr for writing, and err for errors.
# if err is '', or the same as rdr, then stdout and
# stderr of the child are on the same fh.  returns pid
# of child (or dies on failure).


# if wtr begins with '<&', then wtr will be closed in the parent, and
# the child will read from it directly.  if rdr or err begins with
# '>&', then the child will send output directly to that fd.  In both
# cases, there will be a dup() instead of a pipe() made.


# WARNING: this is dangerous, as you may block forever
# unless you are very careful.
#
# $wtr is left unbuffered.
#
# abort program if
#   rdr or wtr are null
#   a system call fails

our $Me = 'open3 (bug)';	# you should never see this, it's always localized

# Fatal.pm needs to be fixed WRT prototypes.

sub xpipe {
    pipe $_[0], $_[1] or croak "$Me: pipe($_[0], $_[1]) failed: $!";
}

# I tried using a * prototype character for the filehandle but it still
# disallows a bareword while compiling under strict subs.

sub xopen {
    open $_[0], $_[1], @_[2..$#_] and return;
    local $" = ', ';
    carp "$Me: open(@_) failed: $!";
}

sub xclose {
    $_[0] =~ /\A=?(\d+)\z/
	? do { my $fh; open($fh, $_[1] . '&=' . $1) and close($fh); }
	: close $_[0]
	or croak "$Me: close($_[0]) failed: $!";
}

sub xfileno {
    return $1 if $_[0] =~ /\A=?(\d+)\z/;  # deal with fh just being an fd
    return fileno $_[0];
}

use constant FORCE_DEBUG_SPAWN => 0;
use constant DO_SPAWN => $^O eq 'os2' || $^O eq 'MSWin32' || FORCE_DEBUG_SPAWN;

sub _open3 {
    local $Me = shift;

    # simulate autovivification of filehandles because
    # it's too ugly to use @_ throughout to make perl do it for us
    # tchrist 5-Mar-00

    # Historically, open3(undef...) has silently worked, so keep
    # it working.
    splice @_, 0, 1, undef if \$_[0] == \undef;
    splice @_, 1, 1, undef if \$_[1] == \undef;
    unless (eval  {
	$_[0] = gensym unless defined $_[0] && length $_[0];
	$_[1] = gensym unless defined $_[1] && length $_[1];
	1; })
    {
	# must strip crud for croak to add back, or looks ugly
	$@ =~ s/(?<=value attempted) at .*//s;
	croak "$Me: $@";
    }

    my @handles = ({ mode => '<', handle => \*STDIN },
		   { mode => '>', handle => \*STDOUT },
		   { mode => '>', handle => \*STDERR },
		  );

    foreach (@handles) {
	$_->{parent} = shift;
	$_->{open_as} = gensym;
    }

    if (@_ > 1 and $_[0] eq '-') {
	croak "Arguments don't make sense when the command is '-'"
    }

    $handles[2]{parent} ||= $handles[1]{parent};
    $handles[2]{dup_of_out} = $handles[1]{parent} eq $handles[2]{parent};

    my $package;
    foreach (@handles) {
	$_->{dup} = ($_->{parent} =~ s/^[<>]&//);

	if ($_->{parent} !~ /\A=?(\d+)\z/) {
	    # force unqualified filehandles into caller's package
	    $package //= caller 1;
	    $_->{parent} = qualify $_->{parent}, $package;
	}

	next if $_->{dup} or $_->{dup_of_out};
	if ($_->{mode} eq '<') {
	    xpipe $_->{open_as}, $_->{parent};
	} else {
	    xpipe $_->{parent}, $_->{open_as};
	}
    }

    my $kidpid;
    if (!DO_SPAWN) {
	# Used to communicate exec failures.
	xpipe my $stat_r, my $stat_w;

	$kidpid = fork;
	croak "$Me: fork failed: $!" unless defined $kidpid;
	if ($kidpid == 0) {  # Kid
	    eval {
		# A tie in the parent should not be allowed to cause problems.
		untie *STDIN;
		untie *STDOUT;
		untie *STDERR;

		close $stat_r;
		require Fcntl;
		my $flags = fcntl $stat_w, &Fcntl::F_GETFD, 0;
		croak "$Me: fcntl failed: $!" unless $flags;
		fcntl $stat_w, &Fcntl::F_SETFD, $flags|&Fcntl::FD_CLOEXEC
		    or croak "$Me: fcntl failed: $!";

		# If she wants to dup the kid's stderr onto her stdout I need to
		# save a copy of her stdout before I put something else there.
		if (!$handles[2]{dup_of_out} && $handles[2]{dup}
			&& xfileno($handles[2]{parent}) == fileno \*STDOUT) {
		    my $tmp = gensym;
		    xopen($tmp, '>&', $handles[2]{parent});
		    $handles[2]{parent} = $tmp;
		}

		foreach (@handles) {
		    if ($_->{dup_of_out}) {
			xopen \*STDERR, ">&STDOUT"
			    if defined fileno STDERR && fileno STDERR != fileno STDOUT;
		    } elsif ($_->{dup}) {
			xopen $_->{handle}, $_->{mode} . '&', $_->{parent}
			    if fileno $_->{handle} != xfileno($_->{parent});
		    } else {
			xclose $_->{parent}, $_->{mode};
			xopen $_->{handle}, $_->{mode} . '&=',
			    fileno $_->{open_as};
		    }
		}
		return 1 if ($_[0] eq '-');
		exec @_ or do {
		    local($")=(" ");
		    croak "$Me: exec of @_ failed";
		};
	    } and do {
                close $stat_w;
                return 0;
            };

	    my $bang = 0+$!;
	    my $err = $@;
	    utf8::encode $err if $] >= 5.008;
	    print $stat_w pack('IIa*', $bang, length($err), $err);
	    close $stat_w;

	    eval { require POSIX; POSIX::_exit(255); };
	    exit 255;
	}
	else {  # Parent
	    close $stat_w;
	    my $to_read = length(pack('I', 0)) * 2;
	    my $bytes_read = read($stat_r, my $buf = '', $to_read);
	    if ($bytes_read) {
		(my $bang, $to_read) = unpack('II', $buf);
		read($stat_r, my $err = '', $to_read);
		waitpid $kidpid, 0; # Reap child which should have exited
		if ($err) {
		    utf8::decode $err if $] >= 5.008;
		} else {
		    $err = "$Me: " . ($! = $bang);
		}
		$! = $bang;
		die($err);
	    }
	}
    }
    else {  # DO_SPAWN
	# All the bookkeeping of coincidence between handles is
	# handled in spawn_with_handles.

	my @close;

	foreach (@handles) {
	    if ($_->{dup_of_out}) {
		$_->{open_as} = $handles[1]{open_as};
	    } elsif ($_->{dup}) {
		$_->{open_as} = $_->{parent} =~ /\A[0-9]+\z/
		    ? $_->{parent} : \*{$_->{parent}};
		push @close, $_->{open_as};
	    } else {
		push @close, \*{$_->{parent}}, $_->{open_as};
	    }
	}
	require IO::Pipe;
	$kidpid = eval {
	    spawn_with_handles(\@handles, \@close, @_);
	};
	die "$Me: $@" if $@;
    }

    foreach (@handles) {
	next if $_->{dup} or $_->{dup_of_out};
	xclose $_->{open_as}, $_->{mode};
    }

    # If the write handle is a dup give it away entirely, close my copy
    # of it.
    xclose $handles[0]{parent}, $handles[0]{mode} if $handles[0]{dup};

    select((select($handles[0]{parent}), $| = 1)[0]); # unbuffer pipe
    $kidpid;
}

sub open3 {
    if (@_ < 4) {
	local $" = ', ';
	croak "open3(@_): not enough arguments";
    }
    return _open3 'open3', @_
}

sub spawn_with_handles {
    my $fds = shift;		# Fields: handle, mode, open_as
    my $close_in_child = shift;
    my ($fd, $pid, @saved_fh, $saved, %saved, @errs);

    foreach $fd (@$fds) {
	$fd->{tmp_copy} = IO::Handle->new_from_fd($fd->{handle}, $fd->{mode});
	$saved{fileno $fd->{handle}} = $fd->{tmp_copy} if $fd->{tmp_copy};
    }
    foreach $fd (@$fds) {
	bless $fd->{handle}, 'IO::Handle'
	    unless eval { $fd->{handle}->isa('IO::Handle') } ;
	# If some of handles to redirect-to coincide with handles to
	# redirect, we need to use saved variants:
	$fd->{handle}->fdopen(defined fileno $fd->{open_as}
			      ? $saved{fileno $fd->{open_as}} || $fd->{open_as}
			      : $fd->{open_as},
			      $fd->{mode});
    }
    unless ($^O eq 'MSWin32') {
	require Fcntl;
	# Stderr may be redirected below, so we save the err text:
	foreach $fd (@$close_in_child) {
	    next unless fileno $fd;
	    fcntl($fd, Fcntl::F_SETFD(), 1) or push @errs, "fcntl $fd: $!"
		unless $saved{fileno $fd}; # Do not close what we redirect!
	}
    }

    unless (@errs) {
	if (FORCE_DEBUG_SPAWN) {
	    pipe my $r, my $w or die "Pipe failed: $!";
	    $pid = fork;
	    die "Fork failed: $!" unless defined $pid;
	    if (!$pid) {
		{ no warnings; exec @_ }
		print $w 0 + $!;
		close $w;
		require POSIX;
		POSIX::_exit(255);
	    }
	    close $w;
	    my $bad = <$r>;
	    if (defined $bad) {
		$! = $bad;
		undef $pid;
	    }
	} else {
	    $pid = eval { system 1, @_ }; # 1 == P_NOWAIT
	}
	push @errs, "IO::Pipe: Can't spawn-NOWAIT: $!" if !$pid || $pid < 0;
    }

    # Do this in reverse, so that STDERR is restored first:
    foreach $fd (reverse @$fds) {
	$fd->{handle}->fdopen($fd->{tmp_copy}, $fd->{mode});
    }
    foreach (values %saved) {
	$_->close or croak "Can't close: $!";
    }
    croak join "\n", @errs if @errs;
    return $pid;
}

1; # so require is happy
