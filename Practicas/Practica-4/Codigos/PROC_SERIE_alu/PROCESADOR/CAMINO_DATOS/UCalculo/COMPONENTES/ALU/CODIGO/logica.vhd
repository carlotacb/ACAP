--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.retardos_pkg.all;

entity logica is
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end logica;

architecture compor of logica is

begin 
logica_p: process (opALU, a, b)
begin
	case (opALU) is
		when ALU_AND => s <= a and b;
		when ALU_OR  => s <= a or b;
		when ALU_XOR => s <= a xor b;
		when others  => s <= a;
	end case;
end process;

end;
