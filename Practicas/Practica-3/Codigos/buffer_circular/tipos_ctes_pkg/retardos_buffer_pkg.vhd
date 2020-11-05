--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package retardos_buffer_pkg is

constant retmux: time := 2 ns;
constant regret: time := 4 ns;
constant regcnt: time := 4 ns;
constant retcontrol: time := 2 ns;
constant retinterface: time:= 1 ns;

constant retBRES: time:= 5 ns;
constant retBRLE: time:= 5 ns;

end package retardos_buffer_pkg;

