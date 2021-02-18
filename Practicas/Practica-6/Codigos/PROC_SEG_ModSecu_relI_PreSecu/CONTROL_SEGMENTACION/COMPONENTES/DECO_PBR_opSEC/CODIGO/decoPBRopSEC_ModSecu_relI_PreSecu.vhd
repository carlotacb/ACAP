--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.riscv32_coop_funct_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.param_disenyo_pkg.all;

entity decoPBRopSEC_ModSecu_relI_PreSecu is 
  port (instruc: in tipo_inst_busq; 
		PBR: out st_PBR;
		SInCond: out st_SInCond;
		SCond: out std_logic;
		opSEC: out st_opSEC);
end decoPBRopSEC_ModSecu_relI_PreSecu;

architecture comportamiento of decoPBRopSEC_ModSecu_relI_PreSecu is

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

	PBR <= PBR_no;
	SInCond <= SInCond_NO;
	SCond <= NO;
	case coop is
		when COOP_LUI | COOP_AUIPC =>
			SECUEN(NO, secuenImpli, opSEC);
			PBR <= PBR_si;

		when COOP_JAL =>
			SECUEN(NO, secuenImpli, opSEC);
			PBR <= PBR_si;
			SInCond <= SInCond_SI;

		when COOP_JALR =>
			SECUEN(SI, secuenIncond, opSEC);
			PBR <= PBR_si;

		when COOP_BRANCH =>
			SECUEN(SI, funct3, opSEC);
			SCond <= SI;

		when COOP_LOAD =>
			SECUEN(NO, secuenImpli, opSEC);
			PBR <= PBR_si;

		when COOP_STORE =>
			SECUEN(NO, secuenImpli, opSEC);
			
		when COOP_REG_IMM | COOP_REG_REG =>
			SECUEN(NO, secuenImpli, opSEC);
			PBR <= PBR_si;

		when COOP_FENCE =>
			SECUEN(NO, secuenImpli, opSEC);

		when COOP_SYS =>
			SECUEN(NO, secuenImpli, opSEC);

		when others => 
			SECUEN(NO, secuenImpli, opSEC);

	end case;
end process;

end;













