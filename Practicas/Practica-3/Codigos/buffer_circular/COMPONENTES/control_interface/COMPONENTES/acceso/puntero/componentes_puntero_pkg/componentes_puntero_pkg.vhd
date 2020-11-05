--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;

package componentes_puntero_pkg is

component cntbin is 
port (ent: in st_puntero;
	sal: out st_puntero);
end component;

component prxval is
   port (e0, e1: in st_puntero;
	pcero, sel: in std_logic;
	sal: out st_puntero);
end component;

component reg is		
port (reloj : in	std_logic;
	D: in st_puntero;
	Q: out st_puntero);
end component;

end package componentes_puntero_pkg;
