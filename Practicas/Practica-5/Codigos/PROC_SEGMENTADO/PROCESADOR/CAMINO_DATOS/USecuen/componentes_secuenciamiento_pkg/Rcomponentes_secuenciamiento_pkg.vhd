--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package Rcomponentes_secuenciamiento_pkg is


component RFMTS is
	port(reloj, pcero, B: in std_logic;
		instr:	in  tipo_inst_busq;
		inmS:	in st_fmtS;
		inmediato: out tam_dat_camino);
end component;


component Rsum_secu is 
	port(reloj, pcero, I: in std_logic;
		a, b: in tipo_direc_inst;
		sel: in st_mSI;
		s: out tipo_direc_inst);
end component;

component Rmuxdirec is
generic (sel1: st_mSIC := mSIC_IMPL; sel2: st_mSIC := mSIC_MOD);
   port (reloj, pcero, B, I: in std_logic;
	d0, d1: in tipo_direc_inst;
	SEL: in st_mSIC;
	s: out tipo_direc_inst);
end component;

component RmuxmSIC is
generic (sel1: st_mSIC := mSIC_IMPL; sel2: st_mSIC := mSIC_MOD);
   port (reloj, pcero, B: in std_logic;
	d0, d1: in tipo_direc_inst;
	SEL: in st_mSIC;
	s: out tipo_direc_inst);
end component;

component Rmxsecseg is
generic (sel1: st_msecseg := msecseg_IMPL; sel2: st_msecseg := msecseg_ISECU);
   port (reloj, pcero, I: in std_logic;
	d0, d1: in tipo_direc_inst;
	opSEC: in st_opSEC;
	s: out tipo_direc_inst);
end component;

component Reval is
	port(reloj, pcero: in std_logic;
		L1, L2:	in  tam_dat_camino;
		ig, me, meu:	out std_logic );
end component;

component RDECS is
	port(reloj, pcero, I: in std_logic;
		opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		mSIC: out st_mSIC);
end component;

component Rcamino_secuen is
	port(reloj, pcero, B, I: in std_logic;
		CP:	in tipo_direc_inst;
		instr:	in tipo_inst_busq;
		inmS:	in st_fmtS;
		mSI:	in st_mSI;
		L1, L2:	in tam_dat_camino;
		mSIC: in st_mSIC;
		opSEC:	in  st_opSEC;
		ig, me, meu: out std_logic;
		CP_impli: out tipo_direc_inst;
		proxCP:	out tipo_direc_inst;
		MI_FR: out std_logic;
		MI_NA: out std_logic);
end component;

end package Rcomponentes_secuenciamiento_pkg;

