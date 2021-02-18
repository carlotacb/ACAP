--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LGR_v is
	port(RID, RS : in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LGR_v;


architecture estructural of LGR_v is

signal t_RS: std_logic;
begin
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
VypWgVFJQF9mw7MY7qqQifaoUHlds46+u1CvaMvMhYdApyEiSKvkGw+3wfs6RAyu
VttlVZmpN2hdK4pm058Pj3fsOdlcIvYuzD7Ekhl2utkP5GqKibsoSSIdZpR4RiF5
5CYRjsLIkPE3+cpj/UzUpLoY+tJq0QCWbUGzrK7eDSo=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 181)

`protect DATA_BLOCK
aHZM/SEie7jBVCN4dDS+I8bR8fs1BKmNkaG2lxYVuwxlyBKRqQSHGhlaVyx2D8nA
6T6le53cdVU/pQXdwT/DnaOgirof67sL6ZJfOz9TKhrpfJJPlsaYugjloHJjQ95g
/1GlC0FOJ6bFEHVcoTbMlHpZXRzPlGksBxB6erbSPJiy4vByrXYG6o1t49XXOB6R
SQEGZvHjk67MGXBa/0+xCIvcOjc7gkdeaU3UVvz+siQ/sDxvH5T1cqrlVLyyXzmp
cNLVdn8ouiwEtsozJ/FTTg==
`protect END_PROTECTED	
end estructural;
