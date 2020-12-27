--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

entity mx2 is
   port (d0, d1: in tam_dat_camino;
	SEL: in std_logic;
	s: out tam_dat_camino);
end mx2;

architecture comportamiento of mx2 is
begin
	with SEL select
		s <= d0  when '0',
			d1 when '1',
			(others => '-') when others; 
end comportamiento;
