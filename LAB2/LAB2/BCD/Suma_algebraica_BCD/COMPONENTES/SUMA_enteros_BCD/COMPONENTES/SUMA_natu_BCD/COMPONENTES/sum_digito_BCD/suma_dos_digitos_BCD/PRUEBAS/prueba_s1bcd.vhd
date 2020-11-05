--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity prueba_s1BCD is

end prueba_s1BCD;

architecture prueba of prueba_s1BCD is

component s1BCD is
port (X: in st_bcd;
	Y: in st_bcd;
	cen: in std_logic;
	S: out st_bcd;
	csal: out std_logic);
end component;

signal A, B, suma: st_bcd;
signal cen, csal: std_logic;
signal error: integer:=0;


begin

s1digiBCD: s1bcd port map(X => A, Y =>B, cen => cen, S => suma, csal => csal);

estimulos: process
variable tmp: std_logic_vector(1 downto 0);

begin
	cen <= '0';
	for i in 0 to 9 loop
		for j in 0 to 9 loop
			A <= std_logic_vector(to_unsigned(i,num_bcd));
			B <= std_logic_vector(to_unsigned(j,num_bcd));
			wait for 4*retsumbin;
			tmp := '0'&csal;
			if (to_integer(unsigned(tmp))*10 + to_integer(unsigned(suma)) /= (i+j)) then
				error <= error + 1;
			end if; 
			assert(to_integer(unsigned(tmp))*10 + to_integer(unsigned(suma)) = (i+j))
			report "la comprobacion falla";
		end loop;   
	end loop;
	cen <= '1';
	for i in 0 to 9 loop
		for j in 0 to 9 loop
			A <= std_logic_vector(to_unsigned(i,num_bcd));
			B <= std_logic_vector(to_unsigned(j,num_bcd));
			wait for 4*retsumbin;
			tmp := '0'&csal;
			if(to_integer(unsigned(tmp))*10 + to_integer(unsigned(suma)) /= (i+j+1)) then
				error <= error + 1;
			end if;
			assert(to_integer(unsigned(tmp))*10 + to_integer(unsigned(suma)) = (i+j+1))
			report "la comprobacion falla";
		end loop;   
	end loop;   
	wait;
end process;

end;

