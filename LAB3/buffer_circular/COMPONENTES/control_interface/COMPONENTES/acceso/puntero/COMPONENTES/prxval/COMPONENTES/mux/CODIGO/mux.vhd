--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;
--! @image html multiplexor.png 

entity mux is
   port (e0, e1: in st_puntero;
	sel: in std_logic;
	sal: out st_puntero);
end mux;

architecture compor of mux is
begin
	sal <= e0 after retmux when sel = '0' else
		e1 after retmux;
 end compor;

