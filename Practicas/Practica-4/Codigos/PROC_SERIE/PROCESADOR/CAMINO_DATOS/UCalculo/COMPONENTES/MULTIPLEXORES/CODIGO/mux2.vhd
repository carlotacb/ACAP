--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.retardos_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

entity mux2 is
generic (sel1: st_mL2 := mL2_REG; sel2: st_mL2 := mL2_IMM);
   port (d0, d1: in tam_dat_camino;
	SEL: in st_mL2;
	s: out tam_dat_camino);
end mux2;

architecture comportamiento of mux2 is
begin
	with SEL select
		s <= d0 after retMUX2 when sel1,
			d1 after retMUX2 when sel2,
			(others => '-') when others; 
end comportamiento;
