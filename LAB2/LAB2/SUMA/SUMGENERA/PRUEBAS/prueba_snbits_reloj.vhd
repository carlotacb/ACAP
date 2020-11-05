--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

entity prueba_snbits_reloj is 
generic(n : integer := 4; periododiv2 : time := 200 ns);
end prueba_snbits_reloj;

architecture prueba of prueba_snbits_reloj is

component snbits is
	generic (n: positive:= n);
	port (a: in std_logic_vector(n-1 downto 0);
		b: in std_logic_vector(n-1 downto 0);
		cen: in std_logic;
		s: out std_logic_vector(n-1 downto 0);
		csal: out std_logic);
end component;

component Snref
	generic (n: positive := n);
	port (A: in std_logic_vector(n-1 downto 0) ;
		B: in std_logic_vector(n-1 downto 0) ;
		cen: in std_logic;
		SUM: out std_logic_vector(n-1 downto 0) ;
		csal: out std_logic);
end component;

signal A, B, SUM, SUMref: std_logic_vector(n-1 downto 0);
signal cen, csal, csalref: std_logic;
signal csal_SUM: std_logic_vector(n downto 0);

signal errores: integer:= 0;

signal reloj: std_logic;
signal final: std_logic := '0';

begin
sumador: snbits generic map(n => n)
			port map (A => A, B => B, cen => cen, csal => csal, s => SUM); 

sumadoref: Snref generic map (n => n)
			port map (A => A, B => B, cen => cen, csal => csalref, SUM => SUMref);

	csal_SUM <= csal & SUM;

estimulos: process
variable t_retardo: time;
variable t_retardomax: time; 
variable t_retardomin: time; 
variable valorAmax: integer; 
variable valorBmax: integer; 
variable valorAmin: integer; 
variable valorBmin: integer;

 


begin
	t_retardomax := 0ns;
	t_retardomin := 0ns;
	for aca in 0 to 1 loop
		for i in 0 to 15 loop
			for j in 0 to 15 loop
				A <= std_logic_vector(to_unsigned(i,n));
				B <= std_logic_vector(to_unsigned(j,n));
				if aca = 0 then
					cen <= '0';
				else
					cen <= '1';
				end if;
				wait until reloj = '0' and reloj'event;

				t_retardo := periododiv2 - csal_SUM'last_event;
--				report "estimulos A: " & integer'image(i) & "  B: " & integer'image(j) & "  " & to_string(now, us) & "  " & to_string(t_retardo, ns);

-- introduzca codigo para actualizar retardos maximo y minimo
				if (t_retardo < t_retardomin or t_retardomin = 0ns) then
				if(t_retardo > 0ns) then
				t_retardomin := t_retardo;
				end if;
				valorAmin := i;
				valorBmin := j;
				end if; 
				if (t_retardo > t_retardomax or t_retardomax = 0ns) then 
				t_retardomax := t_retardo; 
				valorAmax := i; 
				valorBmax := j; 
				end if; 

				assert ((csal_SUM) = (csalref & SUMref))
				report "la comprobacion falla" severity error;

                if(to_integer(unsigned(csal_SUM)) /= (i+j+aca)) then
                    errores <= errores + 1;
                end if; 

-- preparacion del circuito para medir retardos
				A <= (others => 'U');
				B <= (others => 'U');
				cen <= 'U';
				wait until reloj = '1' and reloj'event;
			end loop; 

		end loop; 
	end loop; 


	report "numero de errores: " & integer'image(errores);
	report "Retardo Minimo"&CR &LF &
				"Valor A:" & integer'image(valorAmin) & "Valor B:" & integer'image(valorBmin) & " retardo: " & time'image(t_retardomin) & CR & LF & 
			"Retardo Maximo" &CR &LF & 
				"Valor A:" & integer'image(valorAmax) & "Valor B:" & integer'image(valorBmin) & " retardo: " & time'image(t_retardomax) & CR & LF;

	final <= '1';
	wait;
end process;

rlj: process 	
variable iter : integer := 0;	
begin	
	reloj <= '0'; wait for periododiv2;	
	reloj <= '1'; wait for periododiv2;	
	if final = '1' then	
			wait;	
	end if;	
end process;


end prueba;

