--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;


entity andv1n is 														
	port(a, b: in std_logic;
		s: out std_logic);
end andv1n;

architecture comportamiento of andv1n is

begin
	s <= a and (not b);        
end;
