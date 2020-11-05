--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;		
		
entity snref is 		
generic (tam: positive);		
port (A: in	std_logic_vector(tam-1 downto 0);
	B: in	std_logic_vector(tam-1 downto 0);
	cen: in	std_logic;
	SUM: out	std_logic_vector(tam-1 downto 0) ;
	csal: out	std_logic);
end snref;		

architecture referencia of snref is
signal suma: natural;
signal cociente: std_logic_vector(1 downto 0);
signal t_cen: std_logic_vector(1 downto 0);

begin

	t_cen <= '0' & cen;
	suma <= to_integer(unsigned(A)) + to_integer(unsigned(B))+ to_integer(unsigned(t_cen));
	SUM <= std_logic_vector(to_unsigned((suma mod 2**tam),tam));
	cociente <= std_logic_vector(to_unsigned((suma/(2**tam)),2));
	csal <= cociente(0);

end referencia;

