--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use work.all;		
		
entity prueba_S4bits is 		

end prueba_S4bits;		
		
architecture prueba of prueba_S4bits is		
		
component S4bits is 		
generic(ret_xor: time := 15 ns; ret_and: time := 10 ns; ret_or: time := 15 ns);
port (A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		cen: in	std_logic;
		SUM: out std_logic_vector(3 downto 0);
		csal: out std_logic);
end component;				

-- senyales	
signal A,B: std_logic_vector(3 downto 0); 
signal cen: std_logic;
signal SUM: std_logic_vector(3 downto 0);
signal csal: std_logic;
signal c1, c2, c3, c4: std_logic;

-- instanciacion y estimulos
begin

S4bits0: S4bits port map(A=>A,B=>B,cen=>cen,csal=>csal,SUM=>SUM);
A <= "0011";
B <= "0000","0001" after 200ns, "UUUU" after 400ns;
cen <= '0';

end prueba;		

