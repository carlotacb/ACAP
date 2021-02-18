--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.componentes_control_seg_C_pkg.all;
use work.retardos_cntl_seg_pkg.all;
--! @image html LIB_C.jpg

entity LIB_C is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LIB_C;


architecture estructural of LIB_C is

signal instrucDL: tipo_inst_busq;
signal PBRDL: st_PBR;
signal opsecDL: st_opSEC;

signal RID, RS: std_logic;
	
begin
	R_decPBRSEC: RdecoPBRopSEC port map (reloj => reloj, pcero => pcero, B => B, instruc => instruc,
														instrucDL => instrucDL, PBRDL => PBRDL, opsecDL => opsecDL);
	
	R_dat: ensam_RD_C port map (reloj => reloj, pcero => pcero, I => I, instruc => instrucDL, PBR => PBRDL, 
							C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2, RID => RID);

	R_Sec: ensam_RS port map (reloj => reloj, pcero => pcero, I => I, opsec => opsecDL, RS => RS);

	R_lgr: LGR port map (RID => RID, RS => RS, bloqCP => bloqCP, bloqBDL => bloqBDL, inyecBDL => inyecBDL, inyecDLA => inyecDLA);

end estructural;
