--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity compl9 is 
port ( X: in st_bcd;
	Z: out st_bcd);
end compl9;

architecture comportamiento of compl9 is
begin

	Z <= (others => '0');

end comportamiento;

