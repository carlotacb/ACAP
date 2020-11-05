--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.retardos_nucleo_pkg.all;
--! @image html sumador.png 

entity sumador is
port (a, b: in st_datos;
	s: out st_datos);
end;

architecture behave of sumador is
begin

s <= transport std_logic_vector (unsigned(a) + unsigned(b)) after retsuma;

end;
