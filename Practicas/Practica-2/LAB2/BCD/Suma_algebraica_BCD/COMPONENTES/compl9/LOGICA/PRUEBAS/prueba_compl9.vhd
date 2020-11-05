--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity prueba_compl9 is
end prueba_compl9;

architecture prueba of prueba_compl9 is

component compl9 is 
port (X: in st_bcd;
	Z: out st_bcd);
end component;

signal A, Z: st_bcd;
signal error: integer := 0;

begin

complem9: compl9 port map(X => A, Z => Z);

estimulos: process
begin
	for i in 0 to 9 loop
		A <= std_logic_vector(to_unsigned(i,num_bcd));
        wait for 2*retc9;
		assert(to_integer(unsigned(Z)) = 9 - to_integer(unsigned(A)))
		report "la comprobación falla";
       	if(to_integer(unsigned(Z)) /= 9 - to_integer(unsigned(A))) then
              error <= error + 1;
        end if;
	end loop;   
	wait;
end process;

end;

