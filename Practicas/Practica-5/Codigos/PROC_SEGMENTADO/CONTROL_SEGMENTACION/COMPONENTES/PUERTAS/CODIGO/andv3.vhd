--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;


entity andv3 is 														
	port(a, b, c: in std_logic;
		s: out std_logic);
end andv3;

architecture comportamiento of andv3 is

begin
	s <= a and b and c;        
end;
