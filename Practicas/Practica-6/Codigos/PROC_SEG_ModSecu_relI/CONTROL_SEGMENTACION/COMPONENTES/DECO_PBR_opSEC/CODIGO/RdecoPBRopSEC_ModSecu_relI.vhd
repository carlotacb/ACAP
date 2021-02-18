--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.param_disenyo_pkg.all;
use work.componentes_control_seg_ModSecu_relI_pkg.all;
use work.RegDes_pkg.all;

entity RdecoPBRopSEC_ModSecu_relI is 
  port (reloj, pcero, B: std_logic;
		instruc: in tipo_inst_busq; 
		instrucDL: out tipo_inst_busq; 
		PBRDL: out st_PBR;
		SInCondDL: out st_SInCond;
		opSECDL: out st_opSEC);
end RdecoPBRopSEC_ModSecu_relI;

architecture estructural of RdecoPBRopSEC_ModSecu_relI is
signal t_instrucDL: tipo_inst_busq;
begin

RDDL3_instrucDL: RDB_N generic map (tam => tam_instruc)
			port map (reloj => reloj, pcero => pcero, B => B, e => instruc, s => t_instrucDL);

decPBRSEC:	decoPBRopSEC_ModSecu_relI port map (instruc => t_instrucDL, PBR => PBRDL, SInCond => SInCondDL, opSEC => opSECDL);

instrucDL <= t_instrucDL;

end;













