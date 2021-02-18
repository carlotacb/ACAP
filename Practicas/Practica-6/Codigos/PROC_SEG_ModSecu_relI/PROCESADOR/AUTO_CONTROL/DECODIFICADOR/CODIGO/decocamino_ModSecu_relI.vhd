--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.riscv32_coop_funct_pkg.all;

entity decocamino_ModSecu_relI is 
  port (instruc: in std_logic_vector (31 downto 0); 
		fmtS : out st_fmtS;
		MSI : out st_mSI;
		PBR: out st_PBR;
		fmtD: out st_fmtD;
		mL1: out st_mL1;
		mL2: out st_mL2 ;
		mxrelI: out st_mrelI;
		mES: out st_mES);
end decocamino_ModSecu_relI;

architecture comportamiento of decocamino_ModSecu_relI is

procedure camino(constant v_fmtS: in st_fmtS; constant v_mSI: in st_mSI; constant v_PBR: in st_PBR; constant v_fmtD: in st_fmtD; constant v_mL1: in st_mL1; constant v_mL2: in st_mL2; constant v_mES: in st_mES; 
	constant v_mxrelI: in st_mrelI;
	signal fmtS: out st_fmtS; signal mSI: out st_mSI; signal PBR: out st_PBR; signal fmtD: out st_fmtD; signal mL1: out st_mL1; signal mL2: out st_mL2; signal mES: out st_mES; signal mxrelI: out st_mrelI) is
begin
	fmtS <= v_fmtS;
	mSI <= v_mSI;
	PBR <= v_PBR;
	mL1 <= v_mL1;
	fmtD <= v_fmtD;
	mL2 <= v_mL2;
	mES <= v_mES;
	mxrelI <= v_mxrelI;
end procedure;

begin

decocamino:	process(instruc)
variable coop: codigooper;

begin
	coop:= instruc(6 downto 0);

	case coop is
		when COOP_LUI =>
-- 					fmtS mSI PBR fmtD mL1 mL2 opALU opSEC opMD mES
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_U, mL1_CERO, mL2_IMM, mES_ALU, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_AUIPC =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_U, mL1_CP, mL2_IMM, mES_ALU, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_JAL =>
			camino(fmtS_J, mSI_IRRE, PBR_si, fmtD_IRRE, mL1_IRRE, mL2_IRRE, mES_RET, mrelI_SI, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_JALR =>
			camino(fmtS_I, mSI_REG, PBR_si, fmtD_IRRE, mL1_IRRE, mL2_IRRE, mES_RET, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_BRANCH =>
			camino(fmtS_B, mSI_relat, PBR_no, fmtD_IRRE, mL1_IRRE, mL2_IRRE, mES_IRRE, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_LOAD =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_I, mL1_REG, mL2_IMM, mES_MEM, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_STORE =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_REG_IMM =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_I, mL1_REG, mL2_IMM, mES_ALU, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_REG_REG =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_IRRE, mL1_REG, mL2_REG, mES_ALU, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_FENCE =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when COOP_SYS =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

		when others => 
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, mrelI_NO, fmtS, mSI, PBR, fmtD, mL1, mL2, mES, mxrelI);

	end case;
end process;


end;


