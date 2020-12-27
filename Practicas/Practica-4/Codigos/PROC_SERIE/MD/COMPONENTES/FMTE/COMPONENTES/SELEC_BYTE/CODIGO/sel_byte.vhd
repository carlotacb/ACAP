--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;

entity sel_byte is
port(dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	selec_byte: out selec_bytes_contenedor);
end sel_byte;

architecture estructura of sel_byte is
signal uno: unsigned(num_bytes_contenedor-1 downto 0);
signal posi: integer;
signal selec: selec_bytes_contenedor;

begin
	uno <= to_unsigned(1,num_bytes_contenedor);
	posi <= to_integer(unsigned(dirbyte));
	selec <= std_logic_vector(shift_left(uno, posi));
	selec_byte(0) <= (selec(0) or opMD(1)) and opMD(3);
	selec_byte(1) <= ((selec(0) and opMD(0)) or selec(1) or opMD(1)) and opMD(3);
	selec_byte(2) <= (selec(2) or opMD(1)) and opMD(3);
	selec_byte(3) <= ((selec(2) and opMD(0)) or selec(3) or opMD(1)) and opMD(3);
end; 


