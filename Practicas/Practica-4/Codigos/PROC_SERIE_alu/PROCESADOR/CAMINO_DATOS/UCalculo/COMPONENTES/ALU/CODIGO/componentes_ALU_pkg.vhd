--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_ALU_pkg is

component despla is
	port (opALU: in  st_opALU;
		a: in  tam_dat_camino;
		b: in  tam_dat_camino;
		s: out tam_dat_camino);
end component despla;

component logica is
	port (opALU: in  st_opALU;
		a: in  tam_dat_camino;
		b: in  tam_dat_camino;
		s: out tam_dat_camino);
end component logica;

component sumalg is
    port (opALU: in  st_opALU;
		a: in  tam_dat_camino;
		b: in  tam_dat_camino;
		men: out std_logic;
		s: out tam_dat_camino);
end component sumalg;

component slt is
    port (men: in std_logic;
		s: out tam_dat_camino);
end component slt;

--component mux2 is

--generic (sel1: st_mL2 := mL2_REG; sel2: st_mL2 := mL2_IMM);
--	port (d0, d1: in tam_dat_camino;
--	SEL: in std_logic;
--	s: out tam_dat_camino);
--end component mux2;

component mx2 is
   port (d0, d1: in tam_dat_camino;
	SEL: in std_logic;
	s: out tam_dat_camino);
end component mx2;

end package componentes_ALU_pkg;
