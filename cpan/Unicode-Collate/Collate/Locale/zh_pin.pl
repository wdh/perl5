use Unicode::Collate::CJK::Pinyin;
+{
   overrideCJK => \&Unicode::Collate::CJK::Pinyin::weightPinyin,
   entry => <<'ENTRY', # for DUCET v6.0.0
0101      ; [.15A3.001C.0002.0101] # LATIN SMALL LETTER A WITH MACRON
0061 0304 ; [.15A3.001C.0002.0101] # LATIN SMALL LETTER A WITH MACRON
0100      ; [.15A3.001C.0008.0100] # LATIN CAPITAL LETTER A WITH MACRON
0041 0304 ; [.15A3.001C.0008.0100] # LATIN CAPITAL LETTER A WITH MACRON
00E1      ; [.15A3.001D.0002.00E1] # LATIN SMALL LETTER A WITH ACUTE
0061 0301 ; [.15A3.001D.0002.00E1] # LATIN SMALL LETTER A WITH ACUTE
0061 0341 ; [.15A3.001D.0002.00E1] # LATIN SMALL LETTER A WITH ACUTE
00C1      ; [.15A3.001D.0008.00C1] # LATIN CAPITAL LETTER A WITH ACUTE
0041 0301 ; [.15A3.001D.0008.00C1] # LATIN CAPITAL LETTER A WITH ACUTE
0041 0341 ; [.15A3.001D.0008.00C1] # LATIN CAPITAL LETTER A WITH ACUTE
01CE      ; [.15A3.001E.0002.01CE] # LATIN SMALL LETTER A WITH CARON
0061 030C ; [.15A3.001E.0002.01CE] # LATIN SMALL LETTER A WITH CARON
01CD      ; [.15A3.001E.0008.01CD] # LATIN CAPITAL LETTER A WITH CARON
0041 030C ; [.15A3.001E.0008.01CD] # LATIN CAPITAL LETTER A WITH CARON
00E0      ; [.15A3.001F.0002.00E0] # LATIN SMALL LETTER A WITH GRAVE
0061 0300 ; [.15A3.001F.0002.00E0] # LATIN SMALL LETTER A WITH GRAVE
0061 0340 ; [.15A3.001F.0002.00E0] # LATIN SMALL LETTER A WITH GRAVE
00C0      ; [.15A3.001F.0008.00C0] # LATIN CAPITAL LETTER A WITH GRAVE
0041 0300 ; [.15A3.001F.0008.00C0] # LATIN CAPITAL LETTER A WITH GRAVE
0041 0340 ; [.15A3.001F.0008.00C0] # LATIN CAPITAL LETTER A WITH GRAVE
0113      ; [.15FF.001C.0002.0113] # LATIN SMALL LETTER E WITH MACRON
0065 0304 ; [.15FF.001C.0002.0113] # LATIN SMALL LETTER E WITH MACRON
0112      ; [.15FF.001C.0008.0112] # LATIN CAPITAL LETTER E WITH MACRON
0045 0304 ; [.15FF.001C.0008.0112] # LATIN CAPITAL LETTER E WITH MACRON
00E9      ; [.15FF.001D.0002.00E9] # LATIN SMALL LETTER E WITH ACUTE
0065 0301 ; [.15FF.001D.0002.00E9] # LATIN SMALL LETTER E WITH ACUTE
0065 0341 ; [.15FF.001D.0002.00E9] # LATIN SMALL LETTER E WITH ACUTE
00C9      ; [.15FF.001D.0008.00C9] # LATIN CAPITAL LETTER E WITH ACUTE
0045 0301 ; [.15FF.001D.0008.00C9] # LATIN CAPITAL LETTER E WITH ACUTE
0045 0341 ; [.15FF.001D.0008.00C9] # LATIN CAPITAL LETTER E WITH ACUTE
011B      ; [.15FF.001E.0002.011B] # LATIN SMALL LETTER E WITH CARON
0065 030C ; [.15FF.001E.0002.011B] # LATIN SMALL LETTER E WITH CARON
011A      ; [.15FF.001E.0008.011A] # LATIN CAPITAL LETTER E WITH CARON
0045 030C ; [.15FF.001E.0008.011A] # LATIN CAPITAL LETTER E WITH CARON
00E8      ; [.15FF.001F.0002.00E8] # LATIN SMALL LETTER E WITH GRAVE
0065 0300 ; [.15FF.001F.0002.00E8] # LATIN SMALL LETTER E WITH GRAVE
0065 0340 ; [.15FF.001F.0002.00E8] # LATIN SMALL LETTER E WITH GRAVE
00C8      ; [.15FF.001F.0008.00C8] # LATIN CAPITAL LETTER E WITH GRAVE
0045 0300 ; [.15FF.001F.0008.00C8] # LATIN CAPITAL LETTER E WITH GRAVE
0045 0340 ; [.15FF.001F.0008.00C8] # LATIN CAPITAL LETTER E WITH GRAVE
00EA 0304 ; [.15FF.0021.0002.00EA] # <LATIN SMALL LETTER E WITH CIRCUMFLEX, COMBINING MACRON>
00CA 0304 ; [.15FF.0021.0008.00CA] # <LATIN CAPITAL LETTER E WITH CIRCUMFLEX, COMBINING MACRON>
0065 0302 0304 ; [.15FF.0021.0002.00EA] # <LATIN SMALL LETTER E, COMBINING CIRCUMFLEX ACCENT, COMBINING MACRON>
0045 0302 0304 ; [.15FF.0021.0008.00CA] # <LATIN CAPITAL LETTER E, COMBINING CIRCUMFLEX ACCENT, COMBINING MACRON>
1EBF      ; [.15FF.0022.0002.1EBF] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE
0065 0302 0301 ; [.15FF.0022.0002.1EBF] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE
0065 0302 0341 ; [.15FF.0022.0002.1EBF] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE
1EBE      ; [.15FF.0022.0008.1EBE] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE
0045 0302 0301 ; [.15FF.0022.0008.1EBE] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE
0045 0302 0341 ; [.15FF.0022.0008.1EBE] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE
00EA 0301 ; [.15FF.0022.0002.1EBF] # <LATIN SMALL LETTER E WITH CIRCUMFLEX, COMBINING ACUTE ACCENT>
00EA 0341 ; [.15FF.0022.0002.1EBF] # <LATIN SMALL LETTER E WITH CIRCUMFLEX, COMBINING ACUTE TONE MARK>
00CA 0301 ; [.15FF.0022.0008.1EBE] # <LATIN CAPITAL LETTER E WITH CIRCUMFLEX, COMBINING ACUTE ACCENT>
00CA 0341 ; [.15FF.0022.0008.1EBE] # <LATIN CAPITAL LETTER E WITH CIRCUMFLEX, COMBINING ACUTE TONE MARK>
00EA 030C ; [.15FF.0023.0002.00EA] # <LATIN SMALL LETTER E WITH CIRCUMFLEX, COMBINING CARON>
00CA 030C ; [.15FF.0023.0008.00CA] # <LATIN CAPITAL LETTER E WITH CIRCUMFLEX, COMBINING CARON>
0065 0302 030C ; [.15FF.0023.0002.00EA] # <LATIN SMALL LETTER E, COMBINING CIRCUMFLEX ACCENT, COMBINING CARON>
0045 0302 030C ; [.15FF.0023.0008.00CA] # <LATIN CAPITAL LETTER E, COMBINING CIRCUMFLEX ACCENT, COMBINING CARON>
1EC1      ; [.15FF.0024.0002.1EC1] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE
0065 0302 0300 ; [.15FF.0024.0002.1EC1] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE
0065 0302 0340 ; [.15FF.0024.0002.1EC1] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE
1EC0      ; [.15FF.0024.0008.1EC0] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE
0045 0302 0300 ; [.15FF.0024.0008.1EC0] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE
0045 0302 0340 ; [.15FF.0024.0008.1EC0] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE
00EA 0300 ; [.15FF.0024.0002.1EC1] # <LATIN SMALL LETTER E WITH CIRCUMFLEX, COMBINING GRAVE ACCENT>
00EA 0340 ; [.15FF.0024.0002.1EC1] # <LATIN SMALL LETTER E WITH CIRCUMFLEX, COMBINING GRAVE TONE MARK>
00CA 0300 ; [.15FF.0024.0008.1EC0] # <LATIN CAPITAL LETTER E WITH CIRCUMFLEX, COMBINING GRAVE ACCENT>
00CA 0340 ; [.15FF.0024.0008.1EC0] # <LATIN CAPITAL LETTER E WITH CIRCUMFLEX, COMBINING GRAVE TONE MARK>
00EA      ; [.15FF.0025.0002.00EA] # LATIN SMALL LETTER E WITH CIRCUMFLEX
0065 0302 ; [.15FF.0025.0002.00EA] # LATIN SMALL LETTER E WITH CIRCUMFLEX
00CA      ; [.15FF.0025.0008.00CA] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX
0045 0302 ; [.15FF.0025.0008.00CA] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX
1EC5      ; [.15FF.0025.0002.00EA][.0000.004E.0002.0303] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE
1EC4      ; [.15FF.0025.0008.00CA][.0000.004E.0002.0303] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE
1EC3      ; [.15FF.0025.0002.00EA][.0000.0064.0002.0309] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
1EC2      ; [.15FF.0025.0008.00CA][.0000.0064.0002.0309] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
1EC7      ; [.15FF.0025.0002.00EA][.0000.0070.0002.0323] # LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW
1EC6      ; [.15FF.0025.0008.00CA][.0000.0070.0002.0323] # LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND DOT BELOW
012B      ; [.1680.001C.0002.012B] # LATIN SMALL LETTER I WITH MACRON
0069 0304 ; [.1680.001C.0002.012B] # LATIN SMALL LETTER I WITH MACRON
012A      ; [.1680.001C.0008.012A] # LATIN CAPITAL LETTER I WITH MACRON
0049 0304 ; [.1680.001C.0008.012A] # LATIN CAPITAL LETTER I WITH MACRON
00ED      ; [.1680.001D.0002.00ED] # LATIN SMALL LETTER I WITH ACUTE
0069 0301 ; [.1680.001D.0002.00ED] # LATIN SMALL LETTER I WITH ACUTE
0069 0341 ; [.1680.001D.0002.00ED] # LATIN SMALL LETTER I WITH ACUTE
00CD      ; [.1680.001D.0008.00CD] # LATIN CAPITAL LETTER I WITH ACUTE
0049 0301 ; [.1680.001D.0008.00CD] # LATIN CAPITAL LETTER I WITH ACUTE
0049 0341 ; [.1680.001D.0008.00CD] # LATIN CAPITAL LETTER I WITH ACUTE
01D0      ; [.1680.001E.0002.01D0] # LATIN SMALL LETTER I WITH CARON
0069 030C ; [.1680.001E.0002.01D0] # LATIN SMALL LETTER I WITH CARON
01CF      ; [.1680.001E.0008.01CF] # LATIN CAPITAL LETTER I WITH CARON
0049 030C ; [.1680.001E.0008.01CF] # LATIN CAPITAL LETTER I WITH CARON
00EC      ; [.1680.001F.0002.00EC] # LATIN SMALL LETTER I WITH GRAVE
0069 0300 ; [.1680.001F.0002.00EC] # LATIN SMALL LETTER I WITH GRAVE
0069 0340 ; [.1680.001F.0002.00EC] # LATIN SMALL LETTER I WITH GRAVE
00CC      ; [.1680.001F.0008.00CC] # LATIN CAPITAL LETTER I WITH GRAVE
0049 0300 ; [.1680.001F.0008.00CC] # LATIN CAPITAL LETTER I WITH GRAVE
0049 0340 ; [.1680.001F.0008.00CC] # LATIN CAPITAL LETTER I WITH GRAVE
006D 0304 ; [.16F4.001C.0002.006D] # <LATIN SMALL LETTER M, COMBINING MACRON>
004D 0304 ; [.16F4.001C.0008.004D] # <LATIN CAPITAL LETTER M, COMBINING MACRON>
1E3F      ; [.16F4.001D.0002.1E3F] # LATIN SMALL LETTER M WITH ACUTE
006D 0301 ; [.16F4.001D.0002.1E3F] # LATIN SMALL LETTER M WITH ACUTE
006D 0341 ; [.16F4.001D.0002.1E3F] # LATIN SMALL LETTER M WITH ACUTE
1E3E      ; [.16F4.001D.0008.1E3E] # LATIN CAPITAL LETTER M WITH ACUTE
004D 0301 ; [.16F4.001D.0008.1E3E] # LATIN CAPITAL LETTER M WITH ACUTE
004D 0341 ; [.16F4.001D.0008.1E3E] # LATIN CAPITAL LETTER M WITH ACUTE
006D 030C ; [.16F4.001E.0002.006D] # <LATIN SMALL LETTER M, COMBINING CARON>
004D 030C ; [.16F4.001E.0008.004D] # <LATIN CAPITAL LETTER M, COMBINING CARON>
006D 0300 ; [.16F4.001F.0002.006D] # <LATIN SMALL LETTER M, COMBINING GRAVE ACCENT>
006D 0340 ; [.16F4.001F.0002.006D] # <LATIN SMALL LETTER M, COMBINING GRAVE TONE MARK>
004D 0300 ; [.16F4.001F.0008.004D] # <LATIN CAPITAL LETTER M, COMBINING GRAVE ACCENT>
004D 0340 ; [.16F4.001F.0008.004D] # <LATIN CAPITAL LETTER M, COMBINING GRAVE TONE MARK>
006E 0304 ; [.1702.001C.0002.006E] # <LATIN SMALL LETTER N, COMBINING MACRON>
004E 0304 ; [.1702.001C.0008.004E] # <LATIN CAPITAL LETTER N, COMBINING MACRON>
0144      ; [.1702.001D.0002.0144] # LATIN SMALL LETTER N WITH ACUTE
006E 0301 ; [.1702.001D.0002.0144] # LATIN SMALL LETTER N WITH ACUTE
006E 0341 ; [.1702.001D.0002.0144] # LATIN SMALL LETTER N WITH ACUTE
0143      ; [.1702.001D.0008.0143] # LATIN CAPITAL LETTER N WITH ACUTE
004E 0301 ; [.1702.001D.0008.0143] # LATIN CAPITAL LETTER N WITH ACUTE
004E 0341 ; [.1702.001D.0008.0143] # LATIN CAPITAL LETTER N WITH ACUTE
0148      ; [.1702.001E.0002.0148] # LATIN SMALL LETTER N WITH CARON
006E 030C ; [.1702.001E.0002.0148] # LATIN SMALL LETTER N WITH CARON
0147      ; [.1702.001E.0008.0147] # LATIN CAPITAL LETTER N WITH CARON
004E 030C ; [.1702.001E.0008.0147] # LATIN CAPITAL LETTER N WITH CARON
01F9      ; [.1702.001F.0002.01F9] # LATIN SMALL LETTER N WITH GRAVE
006E 0300 ; [.1702.001F.0002.01F9] # LATIN SMALL LETTER N WITH GRAVE
006E 0340 ; [.1702.001F.0002.01F9] # LATIN SMALL LETTER N WITH GRAVE
01F8      ; [.1702.001F.0008.01F8] # LATIN CAPITAL LETTER N WITH GRAVE
004E 0300 ; [.1702.001F.0008.01F8] # LATIN CAPITAL LETTER N WITH GRAVE
004E 0340 ; [.1702.001F.0008.01F8] # LATIN CAPITAL LETTER N WITH GRAVE
014D      ; [.1724.001C.0002.014D] # LATIN SMALL LETTER O WITH MACRON
006F 0304 ; [.1724.001C.0002.014D] # LATIN SMALL LETTER O WITH MACRON
014C      ; [.1724.001C.0008.014C] # LATIN CAPITAL LETTER O WITH MACRON
004F 0304 ; [.1724.001C.0008.014C] # LATIN CAPITAL LETTER O WITH MACRON
00F3      ; [.1724.001D.0002.00F3] # LATIN SMALL LETTER O WITH ACUTE
006F 0301 ; [.1724.001D.0002.00F3] # LATIN SMALL LETTER O WITH ACUTE
006F 0341 ; [.1724.001D.0002.00F3] # LATIN SMALL LETTER O WITH ACUTE
00D3      ; [.1724.001D.0008.00D3] # LATIN CAPITAL LETTER O WITH ACUTE
004F 0301 ; [.1724.001D.0008.00D3] # LATIN CAPITAL LETTER O WITH ACUTE
004F 0341 ; [.1724.001D.0008.00D3] # LATIN CAPITAL LETTER O WITH ACUTE
01D2      ; [.1724.001E.0002.01D2] # LATIN SMALL LETTER O WITH CARON
006F 030C ; [.1724.001E.0002.01D2] # LATIN SMALL LETTER O WITH CARON
01D1      ; [.1724.001E.0008.01D1] # LATIN CAPITAL LETTER O WITH CARON
004F 030C ; [.1724.001E.0008.01D1] # LATIN CAPITAL LETTER O WITH CARON
00F2      ; [.1724.001F.0002.00F2] # LATIN SMALL LETTER O WITH GRAVE
006F 0300 ; [.1724.001F.0002.00F2] # LATIN SMALL LETTER O WITH GRAVE
006F 0340 ; [.1724.001F.0002.00F2] # LATIN SMALL LETTER O WITH GRAVE
00D2      ; [.1724.001F.0008.00D2] # LATIN CAPITAL LETTER O WITH GRAVE
004F 0300 ; [.1724.001F.0008.00D2] # LATIN CAPITAL LETTER O WITH GRAVE
004F 0340 ; [.1724.001F.0008.00D2] # LATIN CAPITAL LETTER O WITH GRAVE
016B      ; [.17E9.001C.0002.016B] # LATIN SMALL LETTER U WITH MACRON
0075 0304 ; [.17E9.001C.0002.016B] # LATIN SMALL LETTER U WITH MACRON
016A      ; [.17E9.001C.0008.016A] # LATIN CAPITAL LETTER U WITH MACRON
0055 0304 ; [.17E9.001C.0008.016A] # LATIN CAPITAL LETTER U WITH MACRON
00FA      ; [.17E9.001D.0002.00FA] # LATIN SMALL LETTER U WITH ACUTE
0075 0301 ; [.17E9.001D.0002.00FA] # LATIN SMALL LETTER U WITH ACUTE
0075 0341 ; [.17E9.001D.0002.00FA] # LATIN SMALL LETTER U WITH ACUTE
00DA      ; [.17E9.001D.0008.00DA] # LATIN CAPITAL LETTER U WITH ACUTE
0055 0301 ; [.17E9.001D.0008.00DA] # LATIN CAPITAL LETTER U WITH ACUTE
0055 0341 ; [.17E9.001D.0008.00DA] # LATIN CAPITAL LETTER U WITH ACUTE
01D4      ; [.17E9.001E.0002.01D4] # LATIN SMALL LETTER U WITH CARON
0075 030C ; [.17E9.001E.0002.01D4] # LATIN SMALL LETTER U WITH CARON
01D3      ; [.17E9.001E.0008.01D3] # LATIN CAPITAL LETTER U WITH CARON
0055 030C ; [.17E9.001E.0008.01D3] # LATIN CAPITAL LETTER U WITH CARON
00F9      ; [.17E9.001F.0002.00F9] # LATIN SMALL LETTER U WITH GRAVE
0075 0300 ; [.17E9.001F.0002.00F9] # LATIN SMALL LETTER U WITH GRAVE
0075 0340 ; [.17E9.001F.0002.00F9] # LATIN SMALL LETTER U WITH GRAVE
00D9      ; [.17E9.001F.0008.00D9] # LATIN CAPITAL LETTER U WITH GRAVE
0055 0300 ; [.17E9.001F.0008.00D9] # LATIN CAPITAL LETTER U WITH GRAVE
0055 0340 ; [.17E9.001F.0008.00D9] # LATIN CAPITAL LETTER U WITH GRAVE
01D6      ; [.17E9.0021.0002.01D6] # LATIN SMALL LETTER U WITH DIAERESIS AND MACRON
0075 0308 0304 ; [.17E9.0021.0002.01D6] # LATIN SMALL LETTER U WITH DIAERESIS AND MACRON
01D5      ; [.17E9.0021.0008.01D5] # LATIN CAPITAL LETTER U WITH DIAERESIS AND MACRON
0055 0308 0304 ; [.17E9.0021.0008.01D5] # LATIN CAPITAL LETTER U WITH DIAERESIS AND MACRON
00FC 0304 ; [.17E9.0021.0002.01D6] # <LATIN SMALL LETTER U WITH DIAERESIS, COMBINING MACRON>
00DC 0304 ; [.17E9.0021.0008.01D5] # <LATIN CAPITAL LETTER U WITH DIAERESIS, COMBINING MACRON>
01D8      ; [.17E9.0022.0002.01D8] # LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE
0075 0308 0301 ; [.17E9.0022.0002.01D8] # LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE
0075 0308 0341 ; [.17E9.0022.0002.01D8] # LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE
01D7      ; [.17E9.0022.0008.01D7] # LATIN CAPITAL LETTER U WITH DIAERESIS AND ACUTE
0055 0308 0301 ; [.17E9.0022.0008.01D7] # LATIN CAPITAL LETTER U WITH DIAERESIS AND ACUTE
0055 0308 0341 ; [.17E9.0022.0008.01D7] # LATIN CAPITAL LETTER U WITH DIAERESIS AND ACUTE
00FC 0301 ; [.17E9.0022.0002.01D8] # <LATIN SMALL LETTER U WITH DIAERESIS, COMBINING ACUTE ACCENT>
00FC 0341 ; [.17E9.0022.0002.01D8] # <LATIN SMALL LETTER U WITH DIAERESIS, COMBINING ACUTE TONE MARK>
00DC 0301 ; [.17E9.0022.0008.01D7] # <LATIN CAPITAL LETTER U WITH DIAERESIS, COMBINING ACUTE ACCENT>
00DC 0341 ; [.17E9.0022.0008.01D7] # <LATIN CAPITAL LETTER U WITH DIAERESIS, COMBINING ACUTE TONE MARK>
01DA      ; [.17E9.0023.0002.01DA] # LATIN SMALL LETTER U WITH DIAERESIS AND CARON
0075 0308 030C ; [.17E9.0023.0002.01DA] # LATIN SMALL LETTER U WITH DIAERESIS AND CARON
01D9      ; [.17E9.0023.0008.01D9] # LATIN CAPITAL LETTER U WITH DIAERESIS AND CARON
0055 0308 030C ; [.17E9.0023.0008.01D9] # LATIN CAPITAL LETTER U WITH DIAERESIS AND CARON
00FC 030C ; [.17E9.0023.0002.01DA] # <LATIN SMALL LETTER U WITH DIAERESIS, COMBINING CARON>
00DC 030C ; [.17E9.0023.0008.01D9] # <LATIN CAPITAL LETTER U WITH DIAERESIS, COMBINING CARON>
01DC      ; [.17E9.0024.0002.01DC] # LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE
0075 0308 0300 ; [.17E9.0024.0002.01DC] # LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE
0075 0308 0340 ; [.17E9.0024.0002.01DC] # LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE
01DB      ; [.17E9.0024.0008.01DB] # LATIN CAPITAL LETTER U WITH DIAERESIS AND GRAVE
0055 0308 0300 ; [.17E9.0024.0008.01DB] # LATIN CAPITAL LETTER U WITH DIAERESIS AND GRAVE
0055 0308 0340 ; [.17E9.0024.0008.01DB] # LATIN CAPITAL LETTER U WITH DIAERESIS AND GRAVE
00FC 0300 ; [.17E9.0024.0002.01DC] # <LATIN SMALL LETTER U WITH DIAERESIS, COMBINING GRAVE ACCENT>
00FC 0340 ; [.17E9.0024.0002.01DC] # <LATIN SMALL LETTER U WITH DIAERESIS, COMBINING GRAVE TONE MARK>
00DC 0300 ; [.17E9.0024.0008.01DB] # <LATIN CAPITAL LETTER U WITH DIAERESIS, COMBINING GRAVE ACCENT>
00DC 0340 ; [.17E9.0024.0008.01DB] # <LATIN CAPITAL LETTER U WITH DIAERESIS, COMBINING GRAVE TONE MARK>
00FC      ; [.17E9.0025.0002.00FC] # LATIN SMALL LETTER U WITH DIAERESIS
0075 0308 ; [.17E9.0025.0002.00FC] # LATIN SMALL LETTER U WITH DIAERESIS
00DC      ; [.17E9.0025.0008.00DC] # LATIN CAPITAL LETTER U WITH DIAERESIS
0055 0308 ; [.17E9.0025.0008.00DC] # LATIN CAPITAL LETTER U WITH DIAERESIS
3007      ; [.A3E5.0020.0002.3007] # IDEOGRAPHIC NUMBER ZERO
ENTRY
};
