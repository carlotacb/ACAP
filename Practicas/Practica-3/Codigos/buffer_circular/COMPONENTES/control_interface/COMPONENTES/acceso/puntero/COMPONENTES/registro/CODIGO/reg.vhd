--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;

entity reg is
port (reloj : in	std_logic;
	D: in st_puntero;
	Q: out st_puntero);
end reg;

architecture compor of reg is
begin

reg: Process (reloj)		
begin 		
	if rising_edge(reloj) then
		Q <= D after regret;
	end if;
end process;

end compor;	
