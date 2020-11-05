--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_nucleo_pkg.all;

entity registro is		
generic(tam : natural);			
port (reloj: in std_logic;
	e: in std_logic_vector(tam-1 downto 0);
	s: out std_logic_vector(tam-1 downto 0));
end;

architecture comportamiento of registro is
begin

process (reloj) begin
	if rising_edge(reloj) then
		s <= e after retreg;
	end if;
end process;
end;

