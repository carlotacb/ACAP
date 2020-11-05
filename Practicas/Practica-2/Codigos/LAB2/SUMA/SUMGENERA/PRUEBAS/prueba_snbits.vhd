--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.all;

entity prueba_snbits is 
generic(tam : integer := 4; periodo : time := 100 ns);
end prueba_snbits;

architecture prueba of prueba_snbits is

component snbits is
	generic (tam: positive:= tam);
	port (a: in std_logic_vector ( tam-1 downto 0);
		b: in std_logic_vector ( tam-1 downto 0);
		cen: in std_logic;
		s: out std_logic_vector ( tam-1 downto 0);
		csal: out std_logic );
end component;

component Snref
	generic (tam: positive := tam);
	port (A: in std_logic_vector (tam - 1 downto 0) ;
		B: in std_logic_vector (tam - 1 downto 0) ;
		cen: in std_logic;
		SUM: out std_logic_vector (tam - 1 downto 0) ;
		csal: out std_logic);
end component;

signal A, B, SUM, SUMref: std_logic_vector(3 downto 0);
signal cen, csal, csalref: std_logic;

begin
sumador: snbits generic map( tam => tam)
			port map (A=>A, B=>B, cen=>cen, csal=>csal, s=>SUM); 

sumadoref: Snref generic map (tam => tam)
			port map (A=>A, B=>B, cen=>cen, csal=>csalref, SUM=>SUMref);

estimulos: process
begin
	cen <= '0'; 
		for i in 0 to 3 loop
			for j in 0 to 3 loop

				A <= std_logic_vector(to_unsigned(i,tam));
				B <= std_logic_vector(to_unsigned(j,tam));
				wait for periodo;

				assert ((csal & SUM) = (csalref & SUMref))
				report "la comprobación falla" severity error;
			end loop; 
		end loop; 
	cen <= '1';
--		. . .
	wait;
end process;
end prueba;

