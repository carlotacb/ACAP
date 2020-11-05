--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity mayor9 is 
port (X: in st_bcd_mas_1;
	S: out st_bcd;
	csal: out std_logic);
end mayor9;

architecture comportamiento of mayor9 is
-- senyales

begin

	S <= (others => '0') after retmayor9;
	csal <= '0' after retmayor9;

end comportamiento;


