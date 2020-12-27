--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- synthesis translate_off 
use ieee.std_logic_textio.all;
use std.textio.all;
-- synthesis translate_on

use work.param_disenyo_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;

package inicializa_mem_I_pkg is
impure function ini_mem_I (file_name : in string) return t_ramI;

end package inicializa_mem_I_pkg;

package body inicializa_mem_I_pkg is

impure function ini_mem_I (file_name : in string) return t_ramI is
-- synthesis translate_off 
file fitxer_dades : text open read_mode is file_name;
variable linia_dades : line;
-- synthesis translate_on
variable temp_mem : t_ramI;
variable i : natural := 0;

begin
	for i in num_contenedores_Elogico_I-1 downto 0 loop -- hay que inicializar memoria_I
		for j in num_bytes_contenedor_I-1 downto 0 loop	-- en caso contrario QUARTUS no la instancia 
			temp_mem(i)(j) := (others => '0');
		end loop;
	end loop;
-- synthesis translate_off 
	readline(fitxer_dades, linia_dades); -- capçalera
	while not endfile (fitxer_dades) loop
		readline(fitxer_dades, linia_dades);
		for j in num_bytes_I-1 downto 0 loop
			hread (linia_dades, temp_mem(i)(j));
		end loop;
			i := i + 1;
	end loop;
-- synthesis translate_on 
	return temp_mem;


end function;

end package body inicializa_mem_I_pkg;

