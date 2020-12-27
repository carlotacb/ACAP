--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;


entity orv2 is 														
	port (a, b: in std_logic;
		s: out std_logic);
end orv2;

architecture comportamiento of orv2 is

begin
	s <= a or b;        
end;
