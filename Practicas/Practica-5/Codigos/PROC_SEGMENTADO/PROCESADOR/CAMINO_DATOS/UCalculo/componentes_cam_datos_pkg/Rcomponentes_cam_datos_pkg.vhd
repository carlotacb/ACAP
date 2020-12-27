--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package Rcomponentes_cam_datos_pkg is

component RBR is
	port(reloj, pcero, B, I:	in std_logic;
		IDL1:	in dir_reg;				-- 2 puertos de lectura combinatorios
		IDL2:	in dir_reg;
		L1:	out tam_dat_camino;
		L2:	out tam_dat_camino;
		IDE:	in dir_reg;				-- 1 puerto de escritura sincrono
		DE:	in tam_dat_camino;
		PE:	in std_logic);
end component;

component Ralu is
    port (reloj, pcero, I: in std_logic;
		opALU : in st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end component;

component RmL1 is
generic (sel1: st_mL1 := mL1_REG; sel2: st_mL1 := mL1_CP; sel3: st_mL1 := mL1_CERO);
   port (reloj, pcero, B, I: in std_logic;
	d0, d1, d2: in tam_dat_camino;
	SEL: in st_mL1;
	s: out tam_dat_camino);
end component;

component RmL2 is
generic (sel1: st_mL2 := mL2_REG; sel2: st_mL2 := mL2_IMM);
   port (reloj, Pcero, I: std_logic;
	d0, d1: in tam_dat_camino;
	SEL: in st_mL2;
	s: out tam_dat_camino);
end component;

component RmES is
generic (sel1: st_mES := mES_ALU; sel2: st_mES := mES_MEM; sel3: st_mES := mES_RET);
   port (reloj, pcero, B, I: in std_logic;
	d0, d1, d2: in tam_dat_camino;
	SEL: in st_mL1;
	s: out tam_dat_camino);
end component;

component RFMTD is
	port(reloj, pcero, B: in std_logic;
		instr : in  tipo_direc_inst;
		inmD: in st_fmtD;
		inmediato   : out tam_dat_camino);
end component;

component Rcamino_datos is
    port (reloj, pcero, B, I: std_logic;
			instr:	in tipo_inst_busq;
			CP:		in tam_dat_camino;
			inmD:	in st_fmtD;
			DE:	in tam_dat_camino;
			MD_mES:	in tam_dat_camino;
			Secu_mES:	in tam_dat_camino;
			PBR:		in st_PBR;
			mL1:	in st_mL1;
			mL2:	in st_mL2;
			opALU: 	in  st_opALU;
			mES:		in st_mES;
			L1:		out tam_dat_camino;
			L2:		out tam_dat_camino;
			alu_dir: out tam_dat_camino;
			mES_BR: out tam_dat_camino);
end component;

end package Rcomponentes_cam_datos_pkg;
