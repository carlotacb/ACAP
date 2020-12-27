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

package imprimir_inst_ascii_pkg is

procedure imprimir_ascii_U (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_R (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_RI (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_despla_RI (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_load_I (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_jalr_I (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_store_S (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_branch_SB (instruccion: in tipo_inst_busq; l: inout line);
procedure imprimir_ascii_jal_UJ (instruccion: in tipo_inst_busq; l: inout line);

end package imprimir_inst_ascii_pkg;

package body imprimir_inst_ascii_pkg is

procedure imprimir_ascii_U (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias U_imm: std_logic_vector(19 downto 0) is instruccion(31 downto 12);

begin
	if CoOp = COOP_LUI then
		write (l, string'("lui"), right, 8);
	elsif CoOp = COOP_AUIPC then
		write(l, string'("auipc"), right, 8);
	end if;
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(", x"));
	hwrite(l, U_imm);
end procedure imprimir_ascii_U;   

procedure imprimir_ascii_R (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias id_rs2: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias funct7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);

begin
	if CoOp = COOP_REG_REG then
		case funct3 is
			when F3_ADD_SUB =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("add"), right, 8);
					when F7_SUB =>
						write (l, string'("sub"), right, 8);
 					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_SLL =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("sll"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_SLT =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("slt"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_SLTU =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("sltu"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_XOR =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("xor"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_SR_LA =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("srl"), right, 8);
					when F7_SRA =>
						write (l, string'("sra"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_OR =>
				case funct7 is
					when F7_RESTO =>
						write (l, string'("or"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_AND =>
				case funct7 is
 					when F7_RESTO =>
 						write (l, string'("and"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when others =>
				write (l, string'("XXX"), right, 8);	
		end case;
	else
		write (l, CoOp, right, 8);
	end if;

	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(","));
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)),left, 2);
	write (l, string'(","));
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs2)),left, 2);
end procedure imprimir_ascii_R;  


procedure imprimir_ascii_RI (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);

begin
	if CoOp = COOP_REG_IMM then
		case funct3 is
			when F3_ADD_SUB =>
				write (l, string'("addi"), right, 8);
			when F3_SLT =>
				write (l, string'("slti"), right, 8);
			when F3_SLTU =>
				write (l, string'("sltui"), right, 8);
			when F3_XOR =>
				write (l, string'("xori"), right, 8);
			when F3_OR =>
				write (l, string'("ori"), right, 8);
			when F3_AND =>
				write (l, string'("andi"), right, 8);
			when others =>
				write (l, string'("XXX"), right, 8);	
		end case;
	else
		write (l, CoOp, right, 8);
	end if;

	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(","));
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)),left, 2);
	write (l, string'(", x"));
	hwrite(l, I_imm);
end procedure imprimir_ascii_RI;  

procedure imprimir_ascii_despla_RI (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);
alias I_immdes5: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias I_immdes7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);

begin
	if CoOp = COOP_REG_IMM then
		case funct3 is
			when F3_SLL =>
				case I_immdes7 is
					when F7_RESTO =>
						write (l, string'("slli"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when F3_SR_LA =>
				case I_immdes7 is
					when F7_RESTO =>
						write (l, string'("srli"), right, 8);
					when F7_SRA =>
						write (l, string'("srai"), right, 8);
					when others =>
						write (l, string'("XXX"), right, 8);
				end case;
			when others =>
				write (l, string'("XXX"), right, 8);	
		end case;
	else
		write (l, CoOp, right, 8);
	end if;

	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(","));
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)),left, 2);
	write (l, string'(", x"));
	hwrite(l, I_imm);
end procedure imprimir_ascii_despla_RI;  


procedure imprimir_ascii_load_I (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);

begin
	if CoOp = COOP_LOAD then
		case funct3 is
			when LOAD_B =>
				write (l, string'("lb"), right, 8);
			when LOAD_H =>
				write (l, string'("lh"), right, 8);
			when LOAD_W =>
				write (l, string'("lw"), right, 8);
			when LOAD_BU =>
				write (l, string'("lbu"), right, 8);
			when LOAD_HU =>
				write (l, string'("lhu"), right, 8);
			when others =>
				write (l, string'("XXX"), right, 8);	
		end case;
	else
		write (l, CoOp, right, 8);
	end if;

	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(", "));
	write (l, string'("x"));
	hwrite(l, I_imm, right, 3); 
	write (l, string'("(x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)),left, 2);
	write (l, string'(")"));
end procedure imprimir_ascii_load_I;  

procedure imprimir_ascii_jalr_I (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);

begin
	if CoOp = COOP_JALR then
		write (l, string'("jalr"), right, 8);
	else
		write (l, CoOp, right, 8);
	end if;
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(","));
	write (l, string'("x"), right, 2);
	hwrite (l, I_imm, right, 3);
	write (l, string'("(x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)), left, 2);
	write (l, string'(")"));
end procedure imprimir_ascii_jalr_I;  


procedure imprimir_ascii_store_S (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias id_rs2: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_immpar5: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias I_immpar7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);
variable imm_12: std_logic_vector(11 downto 0);
begin
	if CoOp = COOP_STORE then
		case funct3 is
			when STORE_B =>
				write (l, string'("sb"), right, 8);
			when STORE_H =>
				write (l, string'("sh"), right, 8);
			when STORE_W =>
				write (l, string'("sw"), right, 8);
			when others =>
				write (l, string'("XXX"), right, 8);	
		end case;
	else
		write (l, CoOp, right, 8);
	end if;
	imm_12 := I_immpar7 & I_immpar5;
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs2)),left, 2);
	write (l, string'(", "));
	write (l, string'("x"));
	hwrite(l, imm_12, right, 3); 
	write (l, string'("(x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)),left, 2);
	write (l, string'(")"));
end procedure imprimir_ascii_store_S;  


procedure imprimir_ascii_branch_SB (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias id_rs2: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_immpar5: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias I_immpar7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);
variable imm_12: std_logic_vector(11 downto 0);
begin
	if CoOp = COOP_BRANCH then
		case funct3 is
			when COND_BEQ =>
				write (l, string'("beq"), right, 8);
			when COND_BNE =>
				write (l, string'("bne"), right, 8);
			when COND_BLT =>
				write (l, string'("blt"), right, 8);
			when COND_BGE =>
				write (l, string'("bge"), right, 8);
			when COND_BLTU =>
				write (l, string'("bltu"), right, 8);
			when COND_BGEU =>
				write (l, string'("bgeu"), right, 8);
			when others =>
				write (l, string'("XXX"), right, 8);	
		end case;
	else
		write (l, CoOp, right, 8);
	end if;
	imm_12 := I_immpar7(6) & I_immpar5(0) & I_immpar7(5 downto 0) & I_immpar5(4 downto 1);
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs1)),left, 2);
	write (l, string'(","));
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rs2)),left, 2);
	write (l, string'(", "));
	write (l, string'("x"));
	hwrite(l, imm_12, right, 3); 
end procedure imprimir_ascii_branch_SB;  


procedure imprimir_ascii_jal_UJ (instruccion: in tipo_inst_busq; l: inout line) is
alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
variable v_imm_20: std_logic_vector(19 downto 0);

begin
	if CoOp = COOP_JAL then
		write (l, string'("jal"), right, 8);
	else
		write (l, CoOp, right, 8);
	end if;
	v_imm_20 := instruccion(31) & instruccion(19 downto 12) & instruccion(20) & instruccion(30 downto 21);
	write (l, string'("x"), right, 2);
	write (l, to_integer(unsigned(id_rd)),left, 2);
	write (l, string'(",    x"));
	hwrite(l, v_imm_20, right, 5);
end procedure imprimir_ascii_jal_UJ;  


end package body imprimir_inst_ascii_pkg;

