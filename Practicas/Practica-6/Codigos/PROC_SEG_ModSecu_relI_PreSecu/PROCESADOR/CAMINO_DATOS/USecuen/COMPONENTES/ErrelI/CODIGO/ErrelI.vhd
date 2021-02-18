--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;

entity ErrelI is
	port(mxrelI: in st_mrelI;
		ErPre: in std_logic;
		s_mrelI: out std_logic);
end ErrelI;
-- modifique el codigo si es necesario

architecture comporta of ErrelI is
begin
	s_mrelI <= mxrelI and not ErPre;
	
end;
