--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- pragma translate_off 
use ieee.std_logic_textio.all;
use std.textio.all;
-- pragma translate_on

use work.tipos_constan_memoria_pkg.all;

package inicializa_mem_pkg is
impure function ini_mem (file_name : in string) return t_ramD;

end package inicializa_mem_pkg;

package body inicializa_mem_pkg is

impure function ini_mem (file_name : in string) return t_ramD is
-- pragma translate_off 
file fitxer_dades : text open read_mode is file_name;
variable linia_dades : line;
-- pragma translate_on
variable temp_mem : t_ramD;
variable i : natural := 0;

begin
-- pragma translate_off 
	readline(fitxer_dades, linia_dades); -- capçalera
	while not endfile (fitxer_dades) loop
		readline(fitxer_dades, linia_dades);
		for j in num_bytes_contenedor-1 downto 0 loop
			hread (linia_dades, temp_mem(i)(j));
		end loop;
			i := i + 1;
	end loop;
-- pragma translate_on 
	return temp_mem;


end function;

end package body inicializa_mem_pkg;
