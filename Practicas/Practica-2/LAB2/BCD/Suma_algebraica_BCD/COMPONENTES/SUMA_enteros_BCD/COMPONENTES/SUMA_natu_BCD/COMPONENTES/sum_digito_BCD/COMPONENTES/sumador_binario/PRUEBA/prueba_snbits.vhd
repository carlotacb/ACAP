--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity prueba_snbits is
end prueba_snbits;

architecture prueba of prueba_snbits is

component snbits is
port (X: in  st_bcd;
	Y: in  st_bcd;
	cen: in std_logic;
	sum: out st_bcd;
	csal: out std_logic);
end component;

signal A, B, suma: st_bcd;
signal cen, csal: std_logic;
signal error: integer:=0;

begin

sumador: snbits port map(X => A, y => B, cen => cen, sum => suma, csal => csal);

estimulos: process
begin
	cen <= '0';
	for i in 0 to 15 loop
		for j in 0 to 15 loop
			A <= std_logic_vector(to_unsigned(i,num_bcd));
			B <= std_logic_vector(to_unsigned(j,num_bcd));
			wait for 2*retsumbin;
			if(to_integer(unsigned(csal & suma)) /= (i+j)) then
				error <= error + 1;
			end if; 
			assert(to_integer(unsigned(csal & suma)) = (i+j))
			report "la comprobación falla";
		end loop;   
	end loop;
	cen <= '1';
	for i in 0 to 15 loop
		for j in 0 to 15 loop
			A <= std_logic_vector(to_unsigned(i,num_bcd));
			B <= std_logic_vector(to_unsigned(j,num_bcd));
			wait for 2*retsumbin;
			if(to_integer(unsigned(csal & suma)) /= (i+j+1)) then
				error <= error + 1;
			end if;
			assert(to_integer(unsigned(csal & suma)) = (i+j+1))
			report "la comprobación falla";
		end loop;   
	end loop;   
	wait;
end process;

end;

