--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_control_seg_ModSecu_relI_PreSecu_pkg is

component decoPBRopSEC_ModSecu_relI_PreSecu is 
  port (instruc: in tipo_inst_busq; 
		PBR: out st_PBR;
		SInCond: out st_SInCond;
		SCond: out std_logic;
		opSEC: out st_opSEC);
end component;

component RdecoPBRopSEC_ModSecu_relI_PreSecu is 
  port (reloj, pcero, B: std_logic;
		instruc: in tipo_inst_busq; 
		instrucDL: out tipo_inst_busq; 
		PBRDL: out st_PBR;
		SInCondDL: out st_SInCond;
		SCond: out std_logic;
		opSECDL: out st_opSEC);
end component;

component senya_cntlRS_ModSecu_relI_PreSecu is
	port(reloj, pcero, I : in std_logic;
		opsec: in st_opSEC;
		SCond: in std_logic;
		SCondA: out std_logic;
		opsecA : out st_opSEC);
end component;

component LDRS_ModSecu_relI_PreSecu is
	port(opsecDL, opsecA : in st_opSEC;
		SInCond: in st_SInCond;
		SCond, SCondA: in std_logic;
		RS: out std_logic);
end component;

component ensam_RS_ModSecu_relI_PreSecu is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		SInCond: in st_SInCond;
		SCond: in std_logic;
		RS : out std_logic);
end component;

component LGR_PreSecu is
	port(RID: in std_logic;
		RS: in std_logic;
		ErPre: in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

end package componentes_control_seg_ModSecu_relI_PreSecu_pkg;

