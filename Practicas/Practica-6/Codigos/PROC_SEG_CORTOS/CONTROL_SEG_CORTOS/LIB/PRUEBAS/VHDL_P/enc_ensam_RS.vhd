--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity ensam_RS_v is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		RS : out std_logic);
end ensam_RS_v;


architecture estructural of ensam_RS_v is

component LDRS_v is
	port(opsecDL, opsecA : in st_opSEC;
		RS: out std_logic);
end component;

signal opsecA: st_opSEC;

`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
Jl40MbpoTGCvXa2geF33lxRbOrCUcBCVepumSwFFcfCAzdsmq4HBn7fvARMki1Cf
Mn577p6aZ4xAgL4A4SI+lSMifvNChXmcrE6XUUx/Rr+jK077Gukb/iq9/7Gs2y8B
6dZiE8tql47j/gMjvRNgFK9mWly6Kmag9CZPJf9RIv4=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 0)

`protect DATA_BLOCK
PNt5D4I7KDUtFlJu3kVEysmO1SG5b0LW0wEBdQ+/M+8=
`protect END_PROTECTED	
begin

	senyales_cntl: senya_cntlRS port map(reloj => reloj, pcero => pcero, I => I, opsec => opsec, opsecA => opsecA);

	R_sec: LDRS_v port map (opsecDL => opsec, opsecA => opsecA, RS => RS);

end estructural;
