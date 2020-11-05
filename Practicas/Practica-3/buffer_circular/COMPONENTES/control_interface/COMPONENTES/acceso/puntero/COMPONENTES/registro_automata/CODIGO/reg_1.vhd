--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_buffer_pkg.all;

entity reg_1 is
port (reloj : in	std_logic;
	D: in std_logic;
	Q: out std_logic );
end reg_1;

architecture compor of reg_1 is
begin

reg: Process (reloj)		
begin 		
	if rising_edge(reloj) then
		Q <= D after regret;
	end if;
end process;

end compor;	
