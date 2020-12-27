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

entity LIB_v is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LIB_v;

architecture estructural of LIB_v is

component ensam_RD_v is
	port(reloj, pcero, I : in std_logic;
		instruc: in tipo_inst_busq;
		PBR : in std_logic;
		RID: out std_logic);
end component;

component ensam_RS_v is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		RS : out std_logic);
end component;

component LGR_v is
	port(RID, RS : in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component LGR_v;

signal instrucDL: tipo_inst_busq;
signal PBRDL: st_PBR;
signal opsecDL: st_opSEC;

signal RID, RS, t_RS: std_logic;
	
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
TZAoAvGSKP1z6OcsSsk/EsxeACCQRxyGi8HRFIoqri0EAnm0/lkC7c1muN/ukngx
XINz6HcQ9cUmMqOu4HzjznWDPhP0elvKtpVM+5k256Yf/4vwKk5SOHLXwNZ+7o7f
QabtbdciOvAWFAenG+kHgY2bV29K8vNrt3eIwgzt1gQ=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 0)

`protect DATA_BLOCK
C0LHgsCfAq4Fv6d+lEg0eoAGn/488Lv6ZUl921xNIdo=
`protect END_PROTECTED	
begin
	R_decPBRSEC: RdecoPBRopSEC port map (reloj => reloj, pcero => pcero, B => B, instruc => instruc,
														instrucDL => instrucDL, PBRDL => PBRDL, opsecDL => opsecDL);
	
	R_dat: ensam_RD_v port map (reloj => reloj, pcero => pcero, I => I, instruc => instrucDL, PBR => PBRDL, RID => RID);

	R_Sec: ensam_RS_v port map (reloj => reloj, pcero => pcero, I => I, opsec => opsecDL, RS => RS);
	
	R_lgr: LGR_v port map (RID => RID, RS => RS, bloqCP => bloqCP, bloqBDL => bloqBDL, inyecBDL => inyecBDL, inyecDLA => inyecDLA);

end estructural;
