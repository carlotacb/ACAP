--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;

package componentes_prxval_pkg is

component mux is
   port (e0, e1: in st_puntero;
	sel: in std_logic;
	sal: out st_puntero);
end component;

end package componentes_prxval_pkg;
