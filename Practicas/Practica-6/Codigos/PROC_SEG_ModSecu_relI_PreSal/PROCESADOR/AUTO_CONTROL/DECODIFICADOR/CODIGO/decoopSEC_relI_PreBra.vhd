--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;

use work.riscv32_coop_funct_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.param_disenyo_pkg.all;

entity decoopSEC_relI_PreBra is 
  port (instruc: in tipo_inst_busq; 
		SCond: out st_SCond;
		opSEC: out st_opSEC);
end decoopSEC_relI_PreBra;

architecture comportamiento of decoopSEC_relI_PreBra is

procedure SECUEN(constant v_opSEC: in std_logic; funct3: in campofunct3; signal opSEC: out st_opSEC) is
begin
	opSEC <= v_opSEC & funct3;

end procedure;

begin

decoopSEC:	process(instruc)
variable coop: codigooper;
variable funct3: campofunct3;

constant secuenImpli: campofunct3:= IMPLICITO;
constant secuenIncond: campofunct3:= INCONDICIONAL;
constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

begin
	coop:= instruc(6 downto 0);
	funct3:= instruc(14 downto 12);
	SCond <= SCond_NO;

	case coop is
		when COOP_LUI | COOP_AUIPC =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_JAL =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_JALR =>
			SECUEN(SI, secuenIncond, opSEC);

		when COOP_BRANCH =>
			SECUEN(SI, funct3, opSEC);
			SCond <= SCond_SI;

		when COOP_LOAD =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_STORE =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_REG_IMM | COOP_REG_REG =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_FENCE =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_SYS =>
			SECUEN(NO, secuenImpli, opSEC);

		when others => 
			SECUEN(NO, secuenImpli, opSEC);

	end case;
end process;

end;


