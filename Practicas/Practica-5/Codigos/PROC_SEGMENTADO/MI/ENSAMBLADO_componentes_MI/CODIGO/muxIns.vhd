--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.retardos_pkg.all;
use work.param_disenyo_pkg.all;

entity muxIns is
   port (d0, d1: in tipo_inst_busq;
	SEL: in std_logic;
	s: out tipo_inst_busq);
end muxIns;

architecture comportamiento of muxIns is
begin
	with SEL select
		s <= d0 after retMUX2 when '0',
			d1 after retMUX2 when '1',
			(others => '-') when others; 
end comportamiento;
