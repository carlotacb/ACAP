--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.retardos_pkg.all;

entity FMTS is
	port(instr:	in  tipo_inst_busq;
		inmS:	in st_fmtS;
		inmediato: out tam_dat_camino);
end FMTS;

architecture compor of FMTS is
begin
selecformatoS: process(instr, inmS)
variable t_inmediato: tam_dat_camino;
begin
	case inmS is
		when fmtS_J => -- tipo UJ 
			t_inmediato := (31 downto 20 => instr(31)) & instr(19 downto 12) & instr(20) & instr(30 downto 21) & '0';
		when fmtS_I => -- tipo I
			t_inmediato := (31 downto 11 => instr(31)) & instr(30 downto 20);
		when fmtS_B => -- tipo SB 
			t_inmediato := (31 downto 12 => instr(31)) & instr(7) & instr(30 downto 25) & instr(11 downto 8) & '0';
		when others =>
			t_inmediato := (others => '0');
	end case;
	inmediato <= t_inmediato after retfmtS;
end process;

end;


