--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.riscv32_coop_funct_pkg.all;

package cte_tipos_UF_pkg is

constant aluSI: std_logic:= '1';
constant aluNO: std_logic:= '0';

constant ALU_NO	  : st_opALU := aluNO & F7_RESTO(5) & F3_ADD_SUB;
constant ALU_ADD  : st_opALU := aluSI & F7_RESTO(5) & F3_ADD_SUB;	--"10" & F3_ADD_SUB;
constant ALU_SUB  : st_opALU := aluSI & F7_SUB(5) & F3_ADD_SUB;	--"11" & F3_ADD_SUB;
constant ALU_SLL  : st_opALU := aluSI & F7_RESTO(5) & F3_SLL;		--"10" & F3_SLL;
constant ALU_SLT  : st_opALU := aluSI & F7_RESTO(5) & F3_SLT;		--"10" & F3_SLT;
constant ALU_SLTU : st_opALU := aluSI & F7_RESTO(5) & F3_SLTU;		--"10" & F3_SLTU;
constant ALU_XOR  : st_opALU := aluSI & F7_RESTO(5) & F3_XOR;		--"10" & F3_XOR;
constant ALU_SRL  : st_opALU := aluSI & F7_RESTO(5) & F3_SR_LA;	--"10" & F3_SR_LA;
constant ALU_SRA  : st_opALU := aluSI & F7_SRA(5) & F3_SR_LA;		--"11" & F3_SR_LA;
constant ALU_OR   : st_opALU := aluSI & F7_RESTO(5) & F3_OR;		--"10" & F3_OR;
constant ALU_AND  : st_opALU := aluSI & F7_RESTO(5) & F3_AND;		--"10" & F3_AND;

constant secSI: std_logic:= '1';
constant secNO: std_logic:= '0';
constant DECS_BEQ	: st_opSEC	:= secSI & COND_BEQ;
constant DECS_BNE	: st_opSEC	:= secSI & COND_BNE;
constant DECS_BLT	: st_opSEC	:= secSI & COND_BLT;
constant DECS_BGE	: st_opSEC	:= secSI & COND_BGE;
constant DECS_BLTU	: st_opSEC	:= secSI & COND_BLTU;
constant DECS_BGEU	: st_opSEC	:= secSI & COND_BGEU;

-- secuenciamiento implicito e incondicional. Se utilizan valores libres en la codificacion
constant IMPLICITO:	campofunct3 := "000";
constant INCONDICIONAL:	campofunct3 := "011";

constant DECS_IMPLICITO:		st_opSEC := secNO & IMPLICITO;
constant DECS_INCONDICIONAL:	st_opSEC := secSI & INCONDICIONAL;

-- modulo eval
constant igSI: std_logic:= '1';
constant igNO: std_logic:= '0';
constant meSI: std_logic:= '1';
constant meNO: std_logic:= '0';
constant meuSI: std_logic:= '1';
constant meuNO: std_logic:= '0';

constant mdSI: std_logic:= '1';
constant mdNO: std_logic:= '0';
constant mdlec: std_logic:= '0';
constant mdPE: std_logic:= '1';
constant MD_NO	: st_opMD	:= mdNO & mdlec & LOAD_B;
constant MD_LB	: st_opMD	:= mdSI & mdlec & LOAD_B;
constant MD_LH	: st_opMD	:= mdSI & mdlec & LOAD_H;
constant MD_LW	: st_opMD	:= mdSI & mdlec & LOAD_W;
constant MD_LBU	: st_opMD	:= mdSI & mdlec & LOAD_BU;
constant MD_LHU	: st_opMD	:= mdSI & mdlec & LOAD_HU;

constant MD_SB	: st_opMD	:= mdSI & mdPE & STORE_B;
constant MD_SH	: st_opMD	:= mdSI & mdPE & STORE_H;
constant MD_SW	: st_opMD	:= mdSI & mdPE & STORE_W;

end package cte_tipos_UF_pkg;
