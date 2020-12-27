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

entity alu_ref is
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end alu_ref;

architecture compor of alu_ref is

begin 
alu_p: process (opALU, a, b)
variable sa, sb: signed(tam_dat-1 downto 0);
variable ua, ub: unsigned(tam_dat-1 downto 0);

begin
	sa := signed(a);
	sb := signed(b);
	ua := unsigned(a);
	ub := unsigned(b);
        
	case (opALU) is
		when ALU_ADD  => s <= std_logic_vector(ua + ub) after retALU;
		when ALU_SUB  => s <= std_logic_vector(ua - ub) after retALU;
		when ALU_SLT =>
			if sa < sb then
				s <= (tam_dat-1 downto 1 => '0', 0 => '1') after retALU;
			else
				s <= (others => '0') after retALU;
			end if;
		when ALU_SLTU =>
			if ua < ub then
				s <= (tam_dat-1 downto 1 => '0', 0 => '1') after retALU;
			else
				s <= (others => '0') after retALU;
			end if;

		when ALU_AND => s <= a and b after retALU;
		when ALU_OR  => s <= a or b after retALU;
		when ALU_XOR => s <= a xor b after retALU;
		when ALU_SLL => s <= std_logic_vector(shift_left(ua, to_integer(ub(4 downto 0)))) after retALU;
		when ALU_SRA => s <= std_logic_vector(shift_right(sa, to_integer(ub(4 downto 0)))) after retALU;
		when ALU_SRL => s <= std_logic_vector(shift_right(ua, to_integer(ub(4 downto 0)))) after retALU;
		when others  => s <= a after retALU;
	end case;
end process;

end;
