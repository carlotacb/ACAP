--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;

package componentes_snBCD_pkg is

component snBCD is
port (a: in st_ndig_bcd;
	b: in st_ndig_bcd;
	cen: in std_logic;
	s: out st_ndig_bcd;
	csal: out std_logic );
end component;

component s1bit is
port(x: in  std_logic;
	y: in  std_logic;
	cen: in std_logic;
	s: out  std_logic;
	csal: out  std_logic);
end component;

end package componentes_snBCD_pkg;
