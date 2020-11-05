--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;
--! @image html control.png 

entity control is
   port (cabeza: in st_puntero;
	cola, colaincr: in st_puntero;
	vacio: out std_logic;
	lleno: out std_logic);
end control;

architecture compor of control is

begin
-- utilice sentencias de asignacion de senyal condicional para las comparaciones

	lleno <= '0' after retcontrol;
	vacio <= '0' after retcontrol;

end;
