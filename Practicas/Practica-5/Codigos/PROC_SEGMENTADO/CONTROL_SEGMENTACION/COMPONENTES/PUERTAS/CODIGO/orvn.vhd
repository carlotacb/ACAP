--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;


entity orvn is 														
	port(a, b, c, d, e, f: in std_logic;
		s: out std_logic);
end orvn;

architecture comportamiento of orvn is

begin
	s <= a or b or c or d or e or f;        
end;
