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

entity mux3 is
generic (sel1: st_mL1 := mL1_REG; sel2: st_mL1 := mL1_CP; sel3: st_mL1 := mL1_CERO);
   port (d0, d1, d2: in tam_dat_camino;
	SEL: in st_mL1;
	s: out tam_dat_camino);
end mux3;

architecture comportamiento of mux3 is
begin
	with SEL select
		s <= d0 after retMUX3 when sel1,
			d1 after retMUX3 when sel2,
			d2 after retMUX3 when sel3,
			(others => '-') when others; 
end comportamiento;
