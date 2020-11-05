--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_bcd_pkg.all;

entity s1bit is
port(x: in  std_logic;
	y: in  std_logic;
	cen: in std_logic;
	s: out  std_logic;
	csal: out  std_logic);
end s1bit;

architecture funcional of s1bit is

begin
	s <= (x xor y) xor cen after rets1bit;
	csal <= (x and y) or (x and cen) or (y and cen) after rets1bit;
end;

