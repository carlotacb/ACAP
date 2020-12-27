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

entity decoopMD is 
  port (instruc: in tipo_inst_busq; 
		opMD: out st_opMD);
end decoopMD;

architecture comportamiento of decoopMD is

procedure MEM(v_opMD: in std_logic; PEMD: std_logic; funct3: in campofunct3; signal opMD: out st_opMD) is
begin
	opMD <= v_opMD & PEMD & funct3;

end procedure;

begin

decoopMD:	process(instruc)
variable coop: codigooper;
variable funct3: campofunct3;

constant noacceso: campofunct3:= LOAD_B;
constant SI: std_logic:= '1';
constant NO: std_logic:= '0';

begin
	coop:= instruc(6 downto 0);
	funct3:= instruc(14 downto 12);

	case coop is
		when COOP_LUI | COOP_AUIPC =>
			MEM(NO, NO, noacceso, opMD);

		when COOP_JAL | COOP_JALR | COOP_BRANCH =>
			MEM(NO, NO, noacceso, opMD);

		when COOP_LOAD =>
			MEM(SI, NO, funct3, opMD);

		when COOP_STORE =>
			MEM(SI, SI, funct3, opMD);

		when COOP_REG_IMM | COOP_REG_REG =>
			MEM(NO, NO, noacceso, opMD);

		when COOP_FENCE =>
			MEM(NO, NO, noacceso, opMD);

		when COOP_SYS =>
			MEM(NO, NO, noacceso, opMD);

		when others => 
			MEM(NO, NO, noacceso, opMD);

	end case;
end process;


end;


