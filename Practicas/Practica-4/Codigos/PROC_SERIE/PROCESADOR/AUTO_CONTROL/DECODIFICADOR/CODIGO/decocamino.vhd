--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.riscv32_coop_funct_pkg.all;

entity decocamino is 
  port (instruc: in std_logic_vector (31 downto 0); 
		fmtS : out st_fmtS;
		MSI : out st_mSI;
		PBR: out st_PBR;
		fmtD: out st_fmtD;
		mL1: out st_mL1;
		mL2: out st_mL2 ;
		mES: out st_mES);
end decocamino;

architecture comportamiento of decocamino is

procedure camino(constant v_fmtS: in st_fmtS; constant v_mSI: in st_mSI; constant v_PBR: in st_PBR; constant v_fmtD: in st_fmtD; constant v_mL1: in st_mL1; constant v_mL2: in st_mL2; constant v_mES: in st_mES; 
	signal fmtS: out st_fmtS; signal mSI: out st_mSI; signal PBR: out st_PBR; signal fmtD: out st_fmtD; signal mL1: out st_mL1; signal mL2: out st_mL2; signal mES: out st_mES) is
begin
	fmtS <= v_fmtS;
	mSI <= v_mSI;
	PBR <= v_PBR;
	mL1 <= v_mL1;
	fmtD <= v_fmtD;
	mL2 <= v_mL2;
	mES <= v_mES;
end procedure;

begin

decocamino:	process(instruc)
variable coop: codigooper;

begin
	coop:= instruc(6 downto 0);

	case coop is
		when COOP_LUI =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_U, mL1_CERO, mL2_IMM, mES_ALU, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_AUIPC =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_U, mL1_CP, mL2_IMM, mES_ALU, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_JAL =>
			camino(fmtS_J, mSI_CP, PBR_si, fmtD_IRRE, mL1_IRRE, mL2_IRRE, mES_RET, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_JALR =>
			camino(fmtS_I, mSI_REG, PBR_si, fmtD_IRRE, mL1_IRRE, mL2_IRRE, mES_RET, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_BRANCH =>
			camino(fmtS_B, mSI_CP, PBR_no, fmtD_IRRE, mL1_IRRE, mL2_IRRE, mES_IRRE, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_LOAD =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_I, mL1_REG, mL2_IMM, mES_MEM, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_STORE =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_REG_IMM =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_I, mL1_REG, mL2_IMM, mES_ALU, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_REG_REG =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_si, fmtD_IRRE, mL1_REG, mL2_REG, mES_ALU, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_FENCE =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when COOP_SYS =>
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

		when others => 
			camino(fmtS_IRRE, mSI_IRRE, PBR_no, fmtD_S, mL1_REG, mL2_IMM, mES_IRRE, fmtS, mSI, PBR, fmtD, mL1, mL2, mES);

	end case;
end process;


end;


