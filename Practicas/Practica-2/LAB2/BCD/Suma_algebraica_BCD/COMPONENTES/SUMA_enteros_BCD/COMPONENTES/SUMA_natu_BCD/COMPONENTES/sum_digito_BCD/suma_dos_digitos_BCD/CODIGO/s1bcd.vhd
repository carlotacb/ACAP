--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;
use work.componentes_digito_bcd_pkg.all;

entity s1bcd is
port (X: in st_bcd;
	Y: in st_bcd;
	cen: in std_logic;
	S: out st_bcd;
	csal: out std_logic);
end s1bcd;

architecture compor of s1bcd is 
-- senyales

begin

	S <= (others => '0');
	csal <= '0';

end;

