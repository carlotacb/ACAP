--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;

package componentes_control_automata_pkg is

component reg_1 is
port (reloj : in	std_logic;
	D: in std_logic;
	Q: out std_logic );
end component;

end package componentes_control_automata_pkg;
