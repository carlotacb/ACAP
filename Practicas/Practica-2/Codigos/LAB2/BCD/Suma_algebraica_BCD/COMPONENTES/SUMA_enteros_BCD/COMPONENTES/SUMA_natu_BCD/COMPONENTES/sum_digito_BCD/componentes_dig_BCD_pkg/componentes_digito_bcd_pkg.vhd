--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;

package componentes_digito_bcd_pkg is

component mayor9 is 
port (X: in st_bcd_mas_1;
	S: out st_bcd;
	csal: out std_logic);
end component;

component snbits is
port (X: in  st_bcd;
	Y: in  st_bcd;
	cen: in std_logic;
	sum: out st_bcd;
	csal: out std_logic);
end component;

end package componentes_digito_bcd_pkg;
