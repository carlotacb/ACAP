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
--! @image html LIB_fig.jpg

entity LIB is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LIB;

architecture estructural of LIB is

signal instrucDL: tipo_inst_busq;
signal PBRDL: st_PBR;
signal opsecDL: st_opSEC;

signal RID, RS, t_RS: std_logic;
	
begin
	R_decPBRSEC: RdecoPBRopSEC port map (reloj => reloj, pcero => pcero, B => B, instruc => instruc,
														instrucDL => instrucDL, PBRDL => PBRDL, opsecDL => opsecDL);
	
	R_dat: ensam_RD port map (reloj => reloj, pcero => pcero, I => I, instruc => instrucDL, PBR => PBRDL, RID => RID);

	R_Sec: ensam_RS port map (reloj => reloj, pcero => pcero, I => I, opsec => opsecDL, RS => RS);
	
	R_lgr: LGR port map (RID => RID, RS => RS, bloqCP => bloqCP, bloqBDL => bloqBDL, inyecBDL => inyecBDL, inyecDLA => inyecDLA);

end estructural;
