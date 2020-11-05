--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;

package componentes_s1BCD_pkg is

component s1bcd is
port (X: in st_bcd;
	Y: in st_bcd;
	cen: in std_logic;
	S: out st_bcd;
	csal: out std_logic);
end component;

end package componentes_s1BCD_pkg;
