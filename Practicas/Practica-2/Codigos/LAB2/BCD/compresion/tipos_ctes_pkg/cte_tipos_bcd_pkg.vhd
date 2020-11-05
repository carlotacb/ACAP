--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_bcd_pkg is

constant numero_digitos: natural:= 3; --
constant minimo_digitos_DPD: natural:= 3;

constant num_bcd: natural:= 4;
subtype st_bcd is std_logic_vector(num_bcd-1 downto 0);
subtype st_bcd_mas_1 is std_logic_vector(num_bcd downto 0);

constant tres_BCD_bits: natural:= minimo_digitos_DPD * num_bcd;
subtype st_tres_dig_BCD is std_logic_vector(tres_BCD_bits-1 downto 0);

constant tres_DPD_bits: natural:= tres_BCD_bits-2;
subtype st_tres_dig_DPD is std_logic_vector(tres_DPD_bits-1 downto 0);

constant ndigitos: positive:= ((numero_digitos + minimo_digitos_DPD -1)/minimo_digitos_DPD) * minimo_digitos_DPD;

constant num_grupos_DPD: natural:= (ndigitos/minimo_digitos_DPD);
subtype st_DPD is std_logic_vector(num_grupos_DPD*tres_DPD_bits downto 0); --hay que tener en cuenta el bit de signo

constant num_bits_ndigitos: positive:= num_bcd*ndigitos;
subtype st_ndig_bcd is std_logic_vector(num_bits_ndigitos-1 downto 0);
subtype st_ndig_bcd_mas_1 is std_logic_vector (num_bits_ndigitos downto 0);

end package cte_tipos_bcd_pkg;


