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

entity valreg is 
  port (instruc: in tipo_inst_busq; 
		valIDL1, valIDL2: out std_logic);
end valreg;

architecture compor of valreg is

begin

vali_reg: process(instruc)
variable coop: codigooper;

constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

begin
	valIDL1 <= NO;
	valIDL2 <= NO;

	coop:= instruc(6 downto 0);
	case coop is
		when COOP_LUI | COOP_AUIPC =>

		when COOP_JAL =>

		when COOP_JALR =>
				valIDL1 <= SI;

		when COOP_BRANCH =>
				valIDL1 <= SI;
				valIDL2 <= SI;

		when COOP_LOAD =>
				valIDL1 <= SI;

		when COOP_STORE =>
				valIDL1 <= SI;
				valIDL2 <= SI;

		when COOP_REG_IMM =>
				valIDL1 <= SI;

		when COOP_REG_REG =>
				valIDL1 <= SI;
				valIDL2 <= SI;

		when COOP_FENCE =>

		when COOP_SYS =>

		when others => 

	end case;
end process;

end;
