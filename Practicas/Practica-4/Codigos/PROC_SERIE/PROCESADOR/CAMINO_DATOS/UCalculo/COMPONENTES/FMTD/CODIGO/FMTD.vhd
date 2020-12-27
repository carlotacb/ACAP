--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.retardos_pkg.all;

entity FMTD is
	port(instr : in  tipo_inst_busq;
		inmD: in st_fmtD; 
		inmediato   : out tam_dat_camino);
end FMTD;

architecture compor of FMTD is
begin
selecformatoD: process(instr, inmD)
variable t_inmediato: tam_dat_camino;
begin
	case inmD is
		when fmtD_U => -- U type
			t_inmediato := instr(31 downto 12) & (11 downto 0 => '0');
		when fmtD_I => -- I type
			t_inmediato := (31 downto 11 => instr(31)) & instr(30 downto 20);
		when fmtD_S => -- S type
			t_inmediato := (31 downto 11 => instr(31)) & instr(30 downto 25) & instr(11 downto 7);
		when others =>
			t_inmediato := (others => '0');
	end case;
inmediato <= t_inmediato after retfmtD;

end process;

end;


