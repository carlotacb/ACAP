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

entity despla is
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end despla;

architecture compor of despla is

begin 
despla_p: process (opALU, a, b)
variable sa: signed(tam_dat-1 downto 0);
variable ua, ub: unsigned(tam_dat-1 downto 0);

begin
	sa := signed(a);
	ua := unsigned(a);
	ub := unsigned(b);
        
	case (opALU) is
		when ALU_SLL => s <= std_logic_vector(shift_left(ua, to_integer(ub(4 downto 0))));
		when ALU_SRA => s <= std_logic_vector(shift_right(sa, to_integer(ub(4 downto 0))));
		when ALU_SRL => s <= std_logic_vector(shift_right(ua, to_integer(ub(4 downto 0))));
		when others  => s <= a;
	end case;
end process;

end;
