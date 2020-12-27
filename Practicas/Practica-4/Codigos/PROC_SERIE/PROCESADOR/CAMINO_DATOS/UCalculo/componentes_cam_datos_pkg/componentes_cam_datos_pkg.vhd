--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_cam_datos_pkg is

component BR is
	port(reloj:	in std_logic;
		IDL1:	in dir_reg;				-- 2 puertos de lectura combinacionales
		IDL2:	in dir_reg;
		L1:	out tam_dat_camino;
		L2:	out tam_dat_camino;
		IDE:	in dir_reg;				-- 1 puerto de escritura sincrono
		DE:	in tam_dat_camino;
		PE:	in std_logic);
end component;

component alu is
    port (opALU : in st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end component;

component mux2 is
generic (sel1: st_mL2 := mL2_REG; sel2: st_mL2 := mL2_IMM);
   port (d0, d1: in tam_dat_camino;
	SEL: in std_logic;
	s: out tam_dat_camino);
end component;

component mux3 is
generic (sel1: st_mL1 := mL1_REG; sel2: st_mL1 := mL1_CP; sel3: st_mL1 := mL1_CERO);
   port (d0, d1, d2: in tam_dat_camino;
	SEL: in st_mL1;
	s: out tam_dat_camino);
end component;

component mux2_E is
   port (d0, d1: in tam_dat_camino;
	SEL: in std_logic;
	s: out tam_dat_camino);
end component;

component FMTD is
	port(instr : in  tipo_direc_inst;
		inmD: in st_fmtD;
		inmediato   : out tam_dat_camino);
end component;

component camino_datos is
    port (reloj: std_logic;
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

end package componentes_cam_datos_pkg;
