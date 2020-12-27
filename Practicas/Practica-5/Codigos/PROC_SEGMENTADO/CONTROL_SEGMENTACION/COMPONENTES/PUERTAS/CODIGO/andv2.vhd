--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;


entity andv2 is 														
	port(a, b: in std_logic;
		s: out std_logic);
end andv2;

architecture comportamiento of andv2 is

begin
	s <= a and b;        
end;
