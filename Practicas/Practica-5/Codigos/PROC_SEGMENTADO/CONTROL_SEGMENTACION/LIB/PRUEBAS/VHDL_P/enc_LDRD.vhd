--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRD_v is
	port(IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		RD : out std_logic);
end LDRD_v;


architecture estructural of LDRD_v is
signal o11, o12, o13, o14, o21, o22, o3: std_logic;

`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
DjY9YTFTO/JC+cBUdVNPKXMknksCaRRzAbdbYsXQvcg5HovJwLLAfQ6B2X4tshfo
btD5u4XAYPqqmsLNUjxwxIUfzJbmHfS3lGz3liEvGly2kMMg+/2mGR4r+bVgyFaQ
SMrZQQQux4uGGP16BYRqhmn6cEweDEnuM30pdHwXbrI=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 414)

`protect DATA_BLOCK
gS/R9VvuZQwayCAZHGslBP3H7JUXOdY8/9pC2HwGmVI/eLiYguRvSOYAI0StazJ0
hpZFaHl/1jm3Qm3R8HOD7gdiHVPlkekMCxe//Q6F1GhhWunW+mzFEJDROjFzKYbj
z1i0k/HT2wqVlVjZ2brSOOdW8lpJlKND0CvbouAlmTdGD0awS2z2rs+dYgP53ifa
+whBjmvfeZgYhYfSfgbI4obMEn/eZKsWPmdWznqSCAwGYU43eMZNHoLc3chzwbth
AELgrdmHJ6cbAO4f7VFeNOFf9595qVB3nJF/8Aa1ifLrMJZWFZ4bAYjqjzpx7s78
xUEEKr6CmuyUqnM6IckjXmfDErRDcwW3XZcbk2krydm5peppuZFb28BHqJb0+LZc
KZh7tcwx05DEPrchIXAXHFuQGu16bFOA7pvSbHPHqfvykMvwTxNcfgrTnVFMlEue
vUSLR1MwZIiU4TpURGxglpO6p07PL0uZVKYdXvQtFm79+0jxYSpVPKgDmoxoHH0V
6StmROF47uatNHBaNKkSmQcL+EfcDj5vjHkBbrwSfHvkOWBoMHeBUcePuAjDK7F6
`protect END_PROTECTED	
end estructural;
