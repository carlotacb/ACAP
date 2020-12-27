--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

entity mux2M is
generic (tam_mux_datos: natural:= 8);
   port (d0, d1: in std_logic_vector(tam_mux_datos-1 downto 0);
	SEL: in std_logic;
	s: out std_logic_vector(tam_mux_datos-1 downto 0));
end mux2M;

architecture comportamiento of mux2M is
begin
	with SEL select
		s <= d0 when '0',
			d1  when '1',
			(others => '-') when others; 
end comportamiento;
