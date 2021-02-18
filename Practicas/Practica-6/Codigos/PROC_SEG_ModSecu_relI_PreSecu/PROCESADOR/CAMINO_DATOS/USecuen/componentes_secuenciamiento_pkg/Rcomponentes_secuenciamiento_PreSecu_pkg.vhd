--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;

package Rcomponentes_secuenciamiento_PreSecu_pkg is

component RDECS_PreSecu is
	port(reloj, pcero, I: in std_logic;
		opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end component;

component RErsec is
	port(reloj, pcero, I: in std_logic;
		opSEC:	in  st_opSEC;
		ErPre: in std_logic;
		msecuseg: out std_logic);
end component;

component Rcamino_secuen_C_ModSecu_relI_PreSecu is
	port(reloj, pcero, B, I: in std_logic;
		CP:	in tipo_direc_inst;
		instr:	in tipo_inst_busq;
		inmS:	in st_fmtS;
		mSI:	in st_mSI;
		mxrelI: in st_mrelI;
		L1, L2:	in tam_dat_camino;
		mSIC: in st_mSIC;
		opSEC:	in  st_opSEC;
		ErPre: in std_logic;
		ig, me, meu: out std_logic;
		CP_impli: out tipo_direc_inst;
		proxCP:	out tipo_direc_inst;
		MI_FR: out std_logic;
		MI_NA: out std_logic);
end component;


end package Rcomponentes_secuenciamiento_PreSecu_pkg;

