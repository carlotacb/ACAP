--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity prueba_snBCD is
end prueba_snBCD;

architecture prueba of prueba_snBCD is

component snBCD is
port (a: in st_ndig_bcd;
	b: in st_ndig_bcd;
	cen: in std_logic;
	s: out st_ndig_bcd;
	csal: out std_logic );
end component;

signal A, B, suma: st_ndig_bcd;
signal cen, csal: std_logic;
signal error: integer :=0;

begin

sndigiBCD: snBCD port map(a => A, b =>B, cen => cen, s => suma, csal => csal);


estimulos: process
variable Adec, Bdec: integer;
variable sumacompro, sum1: integer;


begin
	for aca in 0 to 1 loop
		if aca = 0 then
			cen <= '0';
		else
			cen <= '1';
		end if;
		for i in 0 to 10**ndigitos-1 loop
			for j in 0 to 10**ndigitos-1 loop
				Adec := i;
				Bdec := j;
				for dig in 0 to ndigitos-1 loop
					A((dig+1)*num_bcd-1 downto dig*num_bcd) <= std_logic_vector(to_unsigned(Adec mod 10,num_bcd));
					B((dig+1)*num_bcd-1 downto dig*num_bcd) <= std_logic_vector(to_unsigned(Bdec mod 10,num_bcd));
					Adec := Adec/10;
					Bdec := Bdec/10;
				end loop;
				wait for 10*retsumbin;

				sumacompro := i+j+aca;

				if csal = '0' then
					sum1 := 0;
				else
					sum1 := 10**ndigitos;
				end if;
				for dig in 0 to ndigitos-1 loop
					sum1 := sum1 + to_integer(unsigned(suma((dig+1)*num_bcd-1 downto dig*num_bcd)))*(10**dig);
				end loop;

				if (sumacompro /= sum1) then
					error <= error + 1;
				end if; 
				assert(sumacompro = sum1)
				report "la comprobación falla" & LF & CR &
					integer'image(i) & " + " & integer'image(j) & " = " & integer'image(sum1) & "  /= res: " & integer'image(sumacompro)
				severity failure;
			end loop;   
		end loop;
	end loop;
	wait;
end process;

end;

