--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;
use ieee.std_logic_textio.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.riscv32_coop_funct_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;

package codificar_instrucciones_pkg is

type tipo_inst_U is (LUI_U, AUIPC_U);
type tipo_inst_R is (ADD_R, SLT_R, SLTU_R, AND_R, OR_R, XOR_R, SLL_R, SRL_R, SUB_R, SRA_R);
type tipo_inst_RI is (ADDI_I, SLTI_I, SLTIU_I, XORI_I, ORI_I, ANDI_I);
type tipo_inst_despla_I is (SLLI_I, SRLI_I, SRAI_I);
type tipo_inst_load_I is (LB_I, LH_I, LW_I, LBU_I, LHU_I);
type tipo_inst_jalr_I is (JALR_I);
type tipo_inst_S is (SB_S, SH_S, SW_S);
type tipo_inst_SB is (BEQ_SB, BNE_SB, BLT_SB, BGE_SB, BLTU_SB, BGEU_SB);
type tipo_inst_UJ is (JAL_UJ);

function cod_tipo_U (tipo_inst: tipo_inst_U; imm_20: std_logic_vector(19 downto 0); rd: natural)
        return tipo_inst_busq;
function cod_tipo_R (tipo_inst: tipo_inst_R; rs1, rs2, rd : natural)
        return tipo_inst_busq;
function cod_tipo_RI (tipo_inst: tipo_inst_RI; imm_12: std_logic_vector(11 downto 0); rs1, rd : natural)
        return tipo_inst_busq;
function cod_tipo_despla_RI (tipo_inst: tipo_inst_despla_I; imm_des_5: std_logic_vector(4 downto 0); rs1, rd : natural)
        return tipo_inst_busq;
function cod_tipo_load_I (tipo_inst: tipo_inst_load_I; imm_12: std_logic_vector(11 downto 0); rs1, rd : natural)
        return tipo_inst_busq;
function cod_tipo_jalr_I (tipo_inst: tipo_inst_jalr_I; imm_12: std_logic_vector(11 downto 0); rs1, rd : natural)
        return tipo_inst_busq;
function cod_tipo_store_S (tipo_inst: tipo_inst_S; imm_12: std_logic_vector(11 downto 0); rs1, rs2: natural)
        return tipo_inst_busq;
function cod_tipo_branch_SB (tipo_inst: tipo_inst_SB; imm_12: std_logic_vector(11 downto 0); rs1, rs2: natural)
        return tipo_inst_busq;
function cod_tipo_jal_UJ (tipo_inst: tipo_inst_UJ; imm_20: std_logic_vector(19 downto 0); rd : natural)
        return tipo_inst_busq;

end package codificar_instrucciones_pkg;


package body codificar_instrucciones_pkg is

function cod_tipo_U (tipo_inst: tipo_inst_U; imm_20: std_logic_vector(19 downto 0); rd: natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias U_imm: std_logic_vector(19 downto 0) is instruccion(31 downto 12);	
begin  
	U_imm := imm_20;
	id_rd := std_logic_vector(to_unsigned(rd, 5));
	case tipo_inst is
		when LUI_U   => CoOp := COOP_LUI; 
		when AUIPC_U => CoOp := COOP_AUIPC; 
	end case;
return instruccion;
end function cod_tipo_U;

function cod_tipo_R (tipo_inst: tipo_inst_R; rs1, rs2, rd : natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias id_rs2: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias funct7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);
begin 
	id_rs2 := std_logic_vector(to_unsigned(rs2, 5));
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	id_rd  := std_logic_vector(to_unsigned(rd, 5));
	CoOP   := COOP_REG_REG;
	case tipo_inst is
		when ADD_R =>
			funct3 := F3_ADD_SUB;
			funct7 := F7_RESTO;
		when SUB_R =>
			funct3 := F3_ADD_SUB;
			funct7 := F7_SUB;
		when SLL_R =>
			funct3 := F3_SLL;
			funct7 := F7_RESTO;
		when SLT_R =>
			funct3 := F3_SLT;
			funct7 := F7_RESTO;
		when SLTU_R =>
			funct3 := F3_SLTU;
			funct7 := F7_RESTO;
		when XOR_R =>
			funct3 := F3_XOR;
			funct7 := F7_RESTO;
		when SRL_R =>
			funct3 := F3_SR_LA;
			funct7 := F7_RESTO;
		when SRA_R =>
			funct3 := F3_SR_LA;
			funct7 := F7_SRA;
		when OR_R =>
			funct3 := F3_OR;
			funct7 := F7_RESTO;
		when AND_R =>
			funct3 := F3_AND;
			funct7 := F7_RESTO;
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_REG_REG";
	end case;
return instruccion;
end function cod_tipo_R;

function cod_tipo_RI (tipo_inst: tipo_inst_RI; imm_12: std_logic_vector(11 downto 0); rs1, rd : natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);
begin 
	I_imm := imm_12;
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	id_rd  := std_logic_vector(to_unsigned(rd, 5));
	CoOP   := COOP_REG_IMM;
	case tipo_inst is
		when ADDI_I =>
			funct3 := F3_ADD_SUB;
		when SLTI_I =>
			funct3 := F3_SLT;
		when SLTIU_I =>
			funct3 := F3_SLTU;
		when XORI_I =>
			funct3 := F3_XOR;
		when ORI_I =>
			funct3 := F3_OR;
		when ANDI_I =>
			funct3 := F3_AND;
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_REG_IMM";
	end case;
return instruccion;
end function cod_tipo_RI;

function cod_tipo_despla_RI (tipo_inst: tipo_inst_despla_I; imm_des_5: std_logic_vector(4 downto 0); rs1, rd : natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);
alias I_immdes5: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias I_immdes7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);
begin 
	I_immdes5 := imm_des_5;
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	id_rd  := std_logic_vector(to_unsigned(rd, 5));
	CoOP   := COOP_REG_IMM;
	case tipo_inst is
		when SLLI_I =>
			funct3 := F3_SLL;
			I_immdes7 := F7_RESTO;
		when SRLI_I =>
			funct3 := F3_SR_LA;
			I_immdes7 := F7_RESTO;
		when SRAI_I =>
			funct3 := F3_SR_LA;
			I_immdes7 := F7_SRA;
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_REG_IMM (desplazamiento)";
	end case;
return instruccion;
end function cod_tipo_despla_RI;

function cod_tipo_load_I (tipo_inst: tipo_inst_load_I; imm_12: std_logic_vector(11 downto 0); rs1, rd : natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);
begin 
	I_imm := imm_12;
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	id_rd  := std_logic_vector(to_unsigned(rd, 5));
	CoOP   := COOP_LOAD;
	case tipo_inst is
		when LB_I =>
			funct3 := LOAD_B;
		when LH_I =>
			funct3 := LOAD_H;
		when LW_I =>
			funct3 := LOAD_W;
		when LBU_I =>
			funct3 := LOAD_BU;
		when LHU_I =>
			funct3 := LOAD_HU;
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_LOAD";
	end case;
return instruccion;
end function cod_tipo_load_I;


function cod_tipo_jalr_I (tipo_inst: tipo_inst_jalr_I; imm_12: std_logic_vector(11 downto 0); rs1, rd : natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);
begin 
	I_imm := imm_12;
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	id_rd  := std_logic_vector(to_unsigned(rd, 5));
	CoOP   := COOP_JALR;
	case tipo_inst is
		when JALR_I =>
			funct3 := (others => '0');
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_JALR";
	end case;
return instruccion;
end function cod_tipo_jalr_I;

function cod_tipo_store_S (tipo_inst: tipo_inst_S; imm_12: std_logic_vector(11 downto 0); rs1, rs2: natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rs2: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_imm: std_logic_vector(11 downto 0) is instruccion(31 downto 20);
alias I_immpar5: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias I_immpar7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);
begin 
	I_immpar7 := imm_12(11 downto 5);
	I_immpar5 := imm_12(4 downto 0);
	id_rs2 := std_logic_vector(to_unsigned(rs2, 5));
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	CoOP   := COOP_STORE;
	case tipo_inst is
		when SB_S =>
			funct3 := STORE_B;
		when SH_S =>
			funct3 := STORE_H;
		when SW_S =>
			funct3 := STORE_W;
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_STORE";
	end case;
return instruccion;
end function cod_tipo_store_S;

function cod_tipo_branch_SB (tipo_inst: tipo_inst_SB; imm_12: std_logic_vector(11 downto 0); rs1, rs2: natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rs2: std_logic_vector(4 downto 0) is instruccion(24 downto 20);
alias id_rs1: std_logic_vector(4 downto 0) is instruccion(19 downto 15);
alias funct3: std_logic_vector(2 downto 0) is instruccion(14 downto 12);
alias I_immpar5: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias I_immpar7: std_logic_vector(6 downto 0) is instruccion(31 downto 25);
begin 
	I_immpar7 := imm_12(11) &  imm_12(9 downto 4);
	I_immpar5 := imm_12(3 downto 0) & imm_12(10);
	id_rs2 := std_logic_vector(to_unsigned(rs2, 5));
	id_rs1 := std_logic_vector(to_unsigned(rs1, 5));
	CoOP   := COOP_BRANCH;
	case tipo_inst is
		when BEQ_SB =>
			funct3 := COND_BEQ;
		when BNE_SB =>
			funct3 := COND_BNE;
		when BLT_SB =>
			funct3 := COND_BLT;
		when BGE_SB =>
			funct3 := COND_BGE;
		when BLTU_SB =>
			funct3 := COND_BLTU;
		when BGEU_SB =>
			funct3 := COND_BGEU;
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_BRANCH";
	end case;
return instruccion;
end function cod_tipo_branch_SB;

function cod_tipo_jal_UJ (tipo_inst: tipo_inst_UJ; imm_20: std_logic_vector(19 downto 0); rd : natural)
        return tipo_inst_busq is

variable instruccion : tipo_inst_busq;

alias CoOp: std_logic_vector(6 downto 0) is instruccion(6 downto 0);
alias id_rd: std_logic_vector(4 downto 0) is instruccion(11 downto 7);
alias I_imm: std_logic_vector(19 downto 0) is instruccion(31 downto 12);
begin 
	I_imm := imm_20(19) & imm_20(9 downto 0) & imm_20(10) & imm_20(18 downto 11);
	id_rd  := std_logic_vector(to_unsigned(rd, 5));
	CoOP   := COOP_JAL;
	case tipo_inst is
		when JAL_UJ =>
			
		when others =>
			report "error en la especificacion de la instruc. de tipo COOP_JAL";
	end case;
return instruccion;
end function cod_tipo_jal_UJ;

end package body codificar_instrucciones_pkg;


