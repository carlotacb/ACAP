--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.riscv32_coop_funct_pkg.all;
use work.param_disenyo_pkg.all;

entity inst_latproh is 
  port (instruc: in tipo_inst_busq; 
		inst_latph: out std_logic);
end inst_latproh;

architecture compor of inst_latproh is

begin

vali_reg: process(instruc)
variable coop: codigooper;

constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

begin
	inst_latph <= NO;

	coop:= instruc(6 downto 0);
	case coop is
		when COOP_LUI | COOP_AUIPC =>

		when COOP_JAL =>
				inst_latph <= SI;

		when COOP_JALR =>
				inst_latph <= SI;

		when COOP_BRANCH =>

		when COOP_LOAD =>
				inst_latph <= SI;

		when COOP_STORE =>

		when COOP_REG_IMM =>

		when COOP_REG_REG =>

		when COOP_FENCE =>

		when COOP_SYS =>

		when others => 

	end case;
end process;

end;
