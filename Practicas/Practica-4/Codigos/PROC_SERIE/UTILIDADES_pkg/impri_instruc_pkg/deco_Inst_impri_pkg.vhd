--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;
use ieee.std_logic_textio.all;

use work.riscv32_coop_funct_pkg.all;
use work.param_disenyo_pkg.all;

use work.imprimir_inst_ascii_pkg.all;

package deco_inst_impri_pkg is
procedure imprimir_ascii_Coerr(l: inout line);
procedure impri_instruc_ascii(instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_ebreak(l: inout line);

end package deco_inst_impri_pkg;

package body deco_inst_impri_pkg is

procedure imprimir_ascii_Coerr(l: inout line) is
begin
	write (l, string'("XXX"), right, 8);
end procedure imprimir_ascii_Coerr; 

procedure imprimir_ascii_ebreak(l: inout line) is
begin
	write (l, string'("       ebreak       "), right, 23);
--	write (l, string'("ebreak ebreak ebreak"), right, 23);
end procedure imprimir_ascii_ebreak; 

procedure impri_instruc_ascii(instruccion: in tipo_inst_busq; l: inout line) is

variable coop: codigooper;
variable funct3: campofunct3;

begin
	coop:= instruccion(6 downto 0);
	funct3:= instruccion(14 downto 12);

	case coop is
		when COOP_LUI | COOP_AUIPC =>
			imprimir_ascii_U (instruccion, l);
			write (l, string'("   "));
		when COOP_JAL =>
			imprimir_ascii_jal_UJ (instruccion, l);

		when COOP_JALR =>
			imprimir_ascii_jalr_I (instruccion, l);

		when COOP_BRANCH =>
			imprimir_ascii_branch_SB (instruccion, l);

		when COOP_LOAD =>
			imprimir_ascii_load_I (instruccion, l);

		when COOP_STORE =>
			imprimir_ascii_store_S (instruccion, l);

		when COOP_REG_IMM =>
			case funct3 is
				when F3_ADD_SUB | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
					imprimir_ascii_RI (instruccion, l);
			    when F3_SLL | F3_SR_LA =>
					imprimir_ascii_despla_RI (instruccion, l);
				when others => 
					imprimir_ascii_Coerr(l);
			end case; 

		when COOP_REG_REG =>
			imprimir_ascii_R (instruccion, l);
			write (l, string'(" ")); --
		when COOP_FENCE =>
			imprimir_ascii_Coerr(l);

		when COOP_SYS =>
			imprimir_ascii_ebreak(l);

		when others => 
			imprimir_ascii_Coerr(l);

	end case;
end procedure impri_instruc_ascii;  

end package body deco_inst_impri_pkg;













