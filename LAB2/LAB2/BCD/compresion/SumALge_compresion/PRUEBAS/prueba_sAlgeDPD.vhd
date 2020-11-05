--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.componentes_compresion_pkg.all;
use work.retardos_bcd_pkg.all;

entity prueba_sAlgeDPD is
  generic (retsum: time:= 8 ns);
end prueba_sAlgeDPD;

architecture prueba of prueba_sAlgeDPD is

component sAlgeDPD is
port ( a: in st_DPD; 
	b: in st_DPD; 
	sumres: in std_logic;
	s: out st_DPD; 
	irre: out std_logic );
end component;

signal Acomp, Bcomp, sumacomp: st_DPD; 

signal A, B, suma: st_ndig_bcd_mas_1; 
signal sumres, csal: std_logic;
signal error, errorexp: integer :=0;
signal irre: std_logic;

begin

snentDPD: sAlgeDPD port map(a => Acomp, b => Bcomp, sumres => sumres, s => sumacomp, irre => irre);


compresion: for i in 1 to num_grupos_DPD generate 
compreA:		BCDaDPD port map (en => A(tres_BCD_bits*i-1 downto tres_BCD_bits*(i-1)), sa => Acomp(tres_DPD_bits*i-1 downto tres_DPD_bits*(i-1)));
compreB:		BCDaDPD port map (en => B(tres_BCD_bits*i-1 downto tres_BCD_bits*(i-1)), sa => Bcomp(tres_DPD_bits*i-1 downto tres_DPD_bits*(i-1)));
end generate;
Acomp(tres_DPD_bits*num_grupos_DPD) <= A(tres_BCD_bits*num_grupos_DPD); 
Bcomp(tres_DPD_bits*num_grupos_DPD) <= B(tres_BCD_bits*num_grupos_DPD); 

descomprimir: for i in 1 to num_grupos_DPD generate 
descomp:	DPDaBCD port map(en => sumacomp(tres_DPD_bits*i-1 downto tres_DPD_bits*(i-1)), sa => suma(tres_BCD_bits*i-1 downto tres_BCD_bits*(i-1)));
end generate;
suma(tres_BCD_bits*num_grupos_DPD) <= sumacomp(tres_DPD_bits*num_grupos_DPD); 

estimulos: process
variable Adec, Bdec: natural;
variable sumacompexp, sumdig, sumexp: natural;
variable iexp, jexp: natural;
variable sumacompro: integer;
variable irrecomp: std_logic;
variable errores: natural := 0;
constant base_mod: integer := 2*(10**ndigitos);
constant emin: integer := -base_mod/2;
constant emax: integer := (base_mod/2) - 1;

begin

	for aca in 0 to 1 loop
		if aca = 0 then
			sumres <= '0';
		else
			sumres <= '1';
		end if;
		for i in -10**(ndigitos) to 10**(ndigitos)-1 loop
			for j in -10**(ndigitos) to 10**(ndigitos) -1 loop
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
                wait for 10*retsumbin;

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
                	report "la comprobación de explicitos falla" & LF & CR &
					integer'image(iexp) & " + " & integer'image(jexp) & " = " & integer'image(sumexp) & "  /= res: " & integer'image(sumacompexp)
					severity failure;
					assert (irre = irrecomp)
	                report "la comprobación de irrepresentabilidad falla" & LF & CR &
					integer'image(i) & " + " & integer'image(j) & " = " & integer'image(sumacompro)
				& " irrecomp: " & std_logic'image(irrecomp) & " irre: " & std_logic'image(irre) 
					severity failure;
				else
                	assert(sumacompexp = sumexp)
                	report "la comprobación de explicitos falla" & LF & CR &
					integer'image(iexp) & " - " & integer'image(jexp) & " = " & integer'image(sumexp) & "  /= res: " & integer'image(sumacompexp)
					severity failure;
					assert (irre = irrecomp)
	                report "la comprobación de irrepresentabilidad falla" & LF & CR &
					integer'image(i) & " - " & integer'image(j) & " = " & integer'image(sumacompro)
				& " irrecomp: " & std_logic'image(irrecomp) & " irre: " & std_logic'image(irre) 
					severity failure;
				end if; 


            end loop;   
        end loop;
	end loop;
	wait;
end process;

end;

