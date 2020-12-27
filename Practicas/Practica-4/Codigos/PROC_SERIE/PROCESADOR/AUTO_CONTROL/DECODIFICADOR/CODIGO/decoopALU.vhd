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

entity decoopALU is 
  port (instruc: in tipo_inst_busq; 
		opALU: out st_opALU);
end decoopALU;

architecture comportamiento of decoopALU is

procedure ALU_cal(constant v_opera: in std_logic; v_modificador: std_logic; funct3: in campofunct3; signal opALU: out st_opALU) is
begin
	opALU <= v_opera & v_modificador & funct3;

end procedure;

begin

decoopALU:	process(instruc)
variable coop: codigooper;
variable funct3: campofunct3;
variable funct7: campofunct7;

constant suma: campofunct3:= F3_ADD_SUB;
constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

begin
	coop:= instruc(6 downto 0);
	funct3:= instruc(14 downto 12);
	funct7:= instruc(31 downto 25);

	case coop is
		when COOP_LUI | COOP_AUIPC =>
			ALU_cal(SI, NO, suma, opALU);

		when COOP_JAL | COOP_JALR | COOP_BRANCH =>
			ALU_cal(NO, NO, suma, opALU);

		when COOP_LOAD | COOP_STORE =>
			ALU_cal(SI, NO, suma, opALU);

		when COOP_REG_IMM =>
			case funct3 is
				when F3_ADD_SUB | F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
							ALU_cal(SI, NO, funct3, opALU);
			    when F3_SR_LA =>
					case funct7 is
						when F7_SRAI  | F7_RESTO =>
							ALU_cal(SI, funct7(5), funct3, opALU);
						when others =>  
							ALU_cal(NO, NO, suma, opALU);
					end case;
				when others => 
					ALU_cal(NO, NO, suma, opALU);
			end case; 

		when COOP_REG_REG =>
			case funct3 is
				when F3_ADD_SUB | F3_SR_LA =>
					case funct7 is 
						when F7_SUB | F7_RESTO =>  
							ALU_cal(SI, funct7(5), funct3, opALU);
						when others => 
							ALU_cal(NO, NO, suma, opALU);
					end case;
				when F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
					case funct7 is 
						when F7_RESTO =>
							ALU_cal(SI, funct7(5), funct3, opALU);
						when others => 
							ALU_cal(NO, NO, suma, opALU);
					end case;
				when others =>
					ALU_cal(NO, NO, suma, opALU);
			end case;

		when COOP_FENCE =>
			ALU_cal(NO, NO, suma, opALU);

		when COOP_SYS =>
			ALU_cal(NO, NO, suma, opALU);

		when others => 
			ALU_cal(NO, NO, suma, opALU);

	end case;
end process;

end;


