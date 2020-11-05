--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;
use ieee.math_real.all;
--library std;
--use std.env.all;

entity prueba_sAlgeBCD is
end prueba_sAlgeBCD;

architecture prueba of prueba_sAlgeBCD is

component sAlgeBCD is
port (a: in st_ndig_bcd_mas_1;
	b: in st_ndig_bcd_mas_1;
	sumres: in std_logic;
	s: out st_ndig_bcd_mas_1;
	irre: out std_logic );
end component;

signal A, B, suma: st_ndig_bcd_mas_1;
signal sumres, irre: std_logic;
signal irre_suma: std_logic_vector(A'length downto 0);

begin

snentBCD: sAlgeBCD port map(a => A, b =>B, sumres => sumres, s => suma, irre => irre);
  
-- TREURE
  irre_suma <= irre & suma;


estimulos: process
constant t_rep: time := 40 ns; -- tiempo entre estimulos de entrada
variable Adec, Bdec: natural;
variable sumacompexp, sumdig, sumexp: natural;
variable iexp, jexp: natural;
variable sumacompro: integer;
variable irrecomp: std_logic;
variable errores: natural := 0;
constant base_mod: integer := 2*(10**ndigitos);
constant emin: integer := -base_mod/2;
constant emax: integer := (base_mod/2) - 1;
variable t_retardo: time;
variable t_max : time := 0 ns;
variable t_min: time := t_rep;
variable A_tmax, A_tmin, B_tmax, B_tmin :st_ndig_bcd_mas_1;
variable sumres_tmax, sumres_tmin: std_logic;

begin

	for aca in 0 to 1 loop
		for i in -10**ndigitos to 10**ndigitos-1 loop
			for j in -10**ndigitos to 10**ndigitos -1 loop

-- Introduzca codigo de preparacion del circuito para medir retardos


				wait for t_rep; -- salidas y senyales internas indefinidas
			  
-- Entradas
    			if aca = 0 then
					sumres <= '0';
				else
					sumres <= '1';
		    	end if;
				A(num_bits_ndigitos) <= '0';
				B(num_bits_ndigitos) <= '0'; 
				if i < 0 then
					A(num_bits_ndigitos) <= '1';
				end if;
				if j < 0 then
					B(num_bits_ndigitos) <= '1';
				end if;

				iexp := i mod base_mod;
				jexp := j mod base_mod;        
       			Adec := iexp;
				Bdec := jexp;
				for dig in 0 to ndigitos-1 loop
                	A((dig+1)*num_bcd-1 downto dig*num_bcd) <= std_logic_vector(to_unsigned(Adec mod 10,num_bcd));
                	B((dig+1)*num_bcd-1 downto dig*num_bcd) <= std_logic_vector(to_unsigned(Bdec mod 10,num_bcd));
					Adec := Adec/10;
					Bdec := Bdec/10;
				end loop;
				wait for t_rep;
-- Introduzca codigo para actualizar retardos maximo y minimo


-- Comprovacion funcionamiento logico
				if sumres = '0' then
					sumacompro := i + j; 
					sumacompexp := (iexp + jexp) mod base_mod;
				else
					sumacompro := i - j; 
					sumacompexp := (iexp - jexp) mod base_mod; 
				end if;

				sumexp := 0;
				if suma(num_bits_ndigitos) = '1' then
					sumexp := 1;
				end if;
				for dig in ndigitos-1 downto 0 loop
					sumexp := sumexp*10 + to_integer(unsigned(suma((dig+1)*num_bcd-1 downto dig*num_bcd)));
				end loop;

				irrecomp := '0';
				if (sumacompro < emin) or (sumacompro > emax) then
					irrecomp := '1';
				end if; 

                if (sumacompexp /= sumexp) or (irrecomp /= irre) then
                    errores := errores + 1;
                end if; 

				if sumres = '0' then 
                	assert(sumacompexp = sumexp)
                	report "la comprobacion de explicitos falla" & LF & CR &
					integer'image(iexp) & " + " & integer'image(jexp) & " = " & integer'image(sumexp) & "  /= res: " & integer'image(sumacompexp)
					severity failure;
					assert (irre = irrecomp)
	                report "la comprobacion de irrepresentabilidad falla" & LF & CR &
					integer'image(i) & " + " & integer'image(j) & " = " & integer'image(sumacompro)
				& " irrecomp: " & std_logic'image(irrecomp) & " irre: " & std_logic'image(irre) 
					severity failure;
				else
                	assert(sumacompexp = sumexp)
                	report "la comprobacion de explicitos falla" & LF & CR &
					integer'image(iexp) & " - " & integer'image(jexp) & " = " & integer'image(sumexp) & "  /= res: " & integer'image(sumacompexp)
					severity failure;
					assert (irre = irrecomp)
	                report "la comprobacion de irrepresentabilidad falla" & LF & CR &
					integer'image(i) & " - " & integer'image(j) & " = " & integer'image(sumacompro)
				& " irrecomp: " & std_logic'image(irrecomp) & " irre: " & std_logic'image(irre) 
					severity failure;
				end if; 


			end loop;   
		end loop;
	end loop;
	
	report "numero de errores: " & integer'image(errores);

-- ELIMINE los comentarios al medir retardos
--	report "retardo minimo: " & to_string(t_min, ns) & "   estimulos A: " & to_string(A_tmin) & "  B: " & to_string(B_tmin) & "  sumres: " & std_logic'image(sumres_tmin); 
--	report "retardo maximo: " & to_string(t_max, ns) & "   estimulos A: " & to_string(A_tmax) & "  B: " & to_string(B_tmax) & "  sumres: " & std_logic'image(sumres_tmax); 
	wait;
end process;

end;

