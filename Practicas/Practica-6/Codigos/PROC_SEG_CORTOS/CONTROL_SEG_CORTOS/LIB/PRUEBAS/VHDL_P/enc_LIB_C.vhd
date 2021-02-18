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

entity LIB_C_v is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LIB_C_v;


architecture estructural of LIB_C_v is

component ensam_RD_C_v is
	port(reloj, pcero, I : in std_logic;
		instruc: in tipo_inst_busq;
		PBR : in std_logic;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
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
a9oYBJWRAQtGzQNLnImGRBhCBn+7zZcCueKNisLO8VEAkLdrqzHPpTDJVOQ00mrs
t0A+Q1g8DCPAZfLPbmnO4SRU095jL8rsBdM7LRL4ah/E8SROjLJWskbbLcXWUTUg
9dQVZcwogZrXfjmF0qtOVzwyg3aGHfEshLRMUTbW/8Y=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 0)

`protect DATA_BLOCK
XlmkkySFZQgPp9CvWVaZCDOiEo9awGqziqPZIhLBz+Y=
`protect END_PROTECTED
begin

	R_decPBRSEC: RdecoPBRopSEC port map (reloj => reloj, pcero => pcero, B => B, instruc => instruc,
														instrucDL => instrucDL, PBRDL => PBRDL, opsecDL => opsecDL);
	
	R_dat: ensam_RD_C_v port map (reloj => reloj, pcero => pcero, I => I, instruc => instrucDL, PBR => PBRDL, 
							C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2, RID => RID);

	R_Sec: ensam_RS_v port map (reloj => reloj, pcero => pcero, I => I, opsec => opsecDL, RS => RS);

	R_lgr: LGR_v port map (RID => RID, RS => RS, bloqCP => bloqCP, bloqBDL => bloqBDL, inyecBDL => inyecBDL, inyecDLA => inyecDLA);

----`protect end
end estructural;
