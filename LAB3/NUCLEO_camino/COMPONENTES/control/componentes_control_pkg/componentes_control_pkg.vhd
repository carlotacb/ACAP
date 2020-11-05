--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.retardos_nucleo_pkg.all;

package componentes_control_pkg is

component registro is						
generic(tam: natural);
port (reloj: in std_logic;
	e: in std_logic_vector(tam-1 downto 0);
	s: out st_iden);
end component;

component reg1 is						
port (reloj: in std_logic;
	e: in std_logic;
	s: out std_logic);
end component;

end package componentes_control_pkg;

