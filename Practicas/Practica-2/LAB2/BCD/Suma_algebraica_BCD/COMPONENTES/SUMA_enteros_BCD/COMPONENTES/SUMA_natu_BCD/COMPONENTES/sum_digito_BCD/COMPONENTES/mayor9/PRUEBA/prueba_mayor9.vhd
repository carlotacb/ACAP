--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity prueba_mayor9 is
--  generic (tam : positive := 5; retardo: time:= 5 ns);
end prueba_mayor9;

architecture prueba of prueba_mayor9 is

component mayor9 is 
port (X: in st_bcd_mas_1;
	S: out st_bcd;
	csal: out std_logic);
end component;

signal A: st_bcd_mas_1;
signal suma: st_bcd;
signal csal:std_logic;
signal error: integer:=0;

begin
  
mayorque9: mayor9 port map(X => A, S => suma, csal => csal);

estimulos: process
begin
      for i in 0 to 31 loop
                A <= std_logic_vector(to_unsigned(i,num_bcd+1));
                wait for 2*retmayor9;
				if i <= 9 then 
					assert(csal & suma = "00000")
					report "la comprobación falla";
               		if(csal & suma /= "00000") then
                    	error <= error + 1;
                	end if;
				else
					assert(csal & suma = "10110")
					report "la comprobación falla";
               		if(csal & suma /= "10110") then
                    	error <= error + 1;
					end if;
				end if;
      end loop;   
      wait;
   end process;

end;
