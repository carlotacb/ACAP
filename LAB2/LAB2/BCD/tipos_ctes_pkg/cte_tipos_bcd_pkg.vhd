--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_bcd_pkg is

constant num_bcd: natural:= 4;
subtype st_bcd is std_logic_vector(num_bcd-1 downto 0);
subtype st_bcd_mas_1 is std_logic_vector(num_bcd downto 0);

constant ndigitos: positive:= 2; --2, 3 para compresion
constant num_bits_ndigitos: positive:= num_bcd*ndigitos;
subtype st_ndig_bcd is std_logic_vector(num_bits_ndigitos-1 downto 0);
subtype st_ndig_bcd_mas_1 is std_logic_vector (num_bits_ndigitos downto 0);

end package cte_tipos_bcd_pkg;


