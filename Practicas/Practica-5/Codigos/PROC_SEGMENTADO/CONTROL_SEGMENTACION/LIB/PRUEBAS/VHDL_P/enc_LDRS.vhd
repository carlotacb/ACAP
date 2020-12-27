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
XDNhbtz/b3Lfl/i3aiH47z//hrZpyOzePytBdDx+Jwv85QLtMcrpbUnt5crBUa2F
G/7prn6e2m/IRT2wsanwL2X5Ld8Dm7XVmwIV4B85KTQ51y6jHcKynX+Z4QaPM8eq
b6/LOc8E7wwDt5EsJ5kWxq46NwsGBROzsNxYsN2kbE0=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 103)

`protect DATA_BLOCK
Hvw2WSh4UM1jCRjAjohVNB3AtV+WnR9Q/tlyeUiKnq8Q/PD5xLdGInGAxJcWySQS
7f3a2nD3NVj94GPkw9h/d+GB8ZVoSS3mcueQ0AGOTnZ7iADS8PKMPEnhoY7dWmoW
hH4A8JUw2GgK9w626BxNW+DbEPm3Ixl6BaRacrdi+9g=
`protect END_PROTECTED	
end estructural;
