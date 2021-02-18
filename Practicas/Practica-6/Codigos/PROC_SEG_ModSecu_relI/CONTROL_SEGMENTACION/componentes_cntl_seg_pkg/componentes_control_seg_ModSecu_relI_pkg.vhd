--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_control_seg_ModSecu_relI_pkg is

component decoPBRopSEC_ModSecu_relI is 
  port (instruc: in tipo_inst_busq; 
		PBR: out st_PBR;
		SInCond: out st_SInCond;
		opSEC: out st_opSEC);
end component;

component RdecoPBRopSEC_ModSecu_relI is 
  port (reloj, pcero, B: std_logic;
		instruc: in tipo_inst_busq; 
		instrucDL: out tipo_inst_busq; 
		PBRDL: out st_PBR;
		SInCondDL: out st_SInCond;
		opSECDL: out st_opSEC);
end component;

component LDRS_ModSecu_relI is
	port(opsecDL, opsecA : in st_opSEC;
		SInCond: in st_SInCond;
		RS: out std_logic);
end component;

component ensam_RS_ModSecu_relI is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		SInCond: in st_SInCond;
		RS : out std_logic);
end component;

end package componentes_control_seg_ModSecu_relI_pkg;

