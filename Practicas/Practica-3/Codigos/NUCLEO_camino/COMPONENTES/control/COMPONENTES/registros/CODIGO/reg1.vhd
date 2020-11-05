--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_nucleo_pkg.all;

entity reg1 is						
port (reloj: in std_logic;
	e: in std_logic;
	s: out std_logic);
end reg1;

architecture comportamiento of reg1 is
begin

process (reloj) begin
	if rising_edge(reloj) then
		s <= e after retreg;
	end if;
end process;
end;

