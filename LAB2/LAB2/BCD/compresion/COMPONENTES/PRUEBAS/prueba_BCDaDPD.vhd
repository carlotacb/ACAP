--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.retardos_bcd_compresion_pkg.all;
use work.cte_tipos_bcd_compresion_pkg.all;

entity prueba_BCDaDPD is
end prueba_BCDaDPD;

architecture prueba of prueba_BCDaDPD is

component BCDaDPD is
port(en: in st_tres_dig_BCD; --std_logic_vector(11 downto 0);
	sa: out st_tres_dig_DPD); --std_logic_vector(9 downto 0) );
end component;

component DPDaBCD is
port(en: in st_tres_dig_DPD; --std_logic_vector(9 downto 0);
	sa: out st_tres_dig_BCD); --std_logic_vector(11 downto 0) );
end component;

signal A, B: st_tres_dig_BCD; -- std_logic_vector(4*(ndigitos-1)+3 downto 0);
signal sa: st_tres_dig_DPD; --std_logic_vector(4*(ndigitos-1)+3-2 downto 0);
signal error: integer:=0;

begin

DeBCDaDPD: BCDaDPD port map(en => A, sa => sa);

DeDPDaBCD: DPDaBCD port map(en => sa, sa => B);

estimulos: process
variable sumdig, adec, adec1: integer;


begin

	for i in 0 to 10**ndigitos-1 loop
		adec:=i;
		adec1:=i;
		for dig in 0 to ndigitos-1 loop
			A((dig+1)*num_bcd-1 downto dig*num_bcd) <= std_logic_vector(to_unsigned(adec mod 10,num_bcd));
			adec := adec/10;
		end loop;
       wait for 10*retBCDaDPD;

        if (A /= B) then
			error <= error + 1;
        end if; 

		sumdig := 0;
		for dig in 0 to ndigitos-1 loop
			sumdig := sumdig + to_integer(unsigned(B((dig+1)*num_bcd-1 downto dig*num_bcd)))*(10**dig);
		end loop;

        assert(A = B)
        report "la comprobación falla" & LF & CR &
		integer'image(to_integer(unsigned(A))) & " salida " & integer'image(to_integer(unsigned(B))) & "  /= res: " & integer'image(sumdig) & "    variable i  " & integer'image(i)
		severity failure;
 
	end loop;
	wait;
end process;

end;

