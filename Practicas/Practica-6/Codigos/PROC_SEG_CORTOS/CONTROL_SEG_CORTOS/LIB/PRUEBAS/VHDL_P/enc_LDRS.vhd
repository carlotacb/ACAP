--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRS_v is
	port(opsecDL, opsecA : in st_opSEC;
		RS: out std_logic);
end LDRS_v;


architecture estructural of LDRS_v is
signal t_RS: std_logic;

`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
h5X7un+6CVjWdtyqKvwjrtT2s8vHEA2z+59Uj5eCYij6JVHXTxQQYmc9HdLH8v9V
hS07xRjmw6thw15YOTRJz0to9pNMMRj3IZ/rvSCMrjl8ao7+jpVNX/240lEtoniQ
wajLJOwO8k+P8KHkRBgiB143S6plI7RvRybxadhg9g4=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 103)

`protect DATA_BLOCK
+A8UcGRTe6znABtTa+yLtj61DJlWBS+tBxhagccnmCRazD8b+8bg0d4Q4N+oGAtV
hQgAGUFOc3PpfN3dxCnsbW9kYRtOKEJy5Vn1Bo13JKtnL/MdAhTLM4wf6EfnMdh7
W3zq1OVHrmFnu8CjzI8FWANGHthxczsrojqXYBUG42U=
`protect END_PROTECTED	
end estructural;
