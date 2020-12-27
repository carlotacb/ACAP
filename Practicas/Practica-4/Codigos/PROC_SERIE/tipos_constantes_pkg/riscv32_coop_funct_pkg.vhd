--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package riscv32_coop_funct_pkg is

constant tamcoop: integer := 7;
constant tamfunct3: integer:= 3;
constant tamfunct7: integer:= 7;

subtype codigooper is std_logic_vector(tamcoop-1 downto 0);
subtype campofunct3 is std_logic_vector(tamfunct3-1 downto 0);
subtype campofunct7 is std_logic_vector(tamfunct7-1 downto 0);

-- RV32I Base
-- Codigos de operacion (CO)
constant COOP_LUI:	codigooper := "0110111";
constant COOP_AUIPC:	codigooper := "0010111";
constant COOP_JAL:	codigooper := "1101111";
constant COOP_JALR:	codigooper := "1100111";
constant COOP_BRANCH:	codigooper := "1100011";
constant COOP_LOAD:	codigooper := "0000011";
constant COOP_STORE:	codigooper := "0100011";
constant COOP_REG_IMM:	codigooper := "0010011";
constant COOP_REG_REG:	codigooper := "0110011";
constant COOP_FENCE:	codigooper := "0001111";
constant COOP_SYS:	codigooper := "1110011";

-- Codigos funct3, R-tipo e I-tipo. Se distinguen por CO
constant F3_ADD_SUB:	campofunct3 := "000";    --se distinguen por campo funct7
constant F3_SLL:	campofunct3 := "001";
constant F3_SLT:	campofunct3 := "010";
constant F3_SLTU:	campofunct3 := "011";
constant F3_XOR:	campofunct3 := "100";
constant F3_SR_LA:	campofunct3 := "101";    --se distinguen por campo funct7
constant F3_OR:		campofunct3 := "110";
constant F3_AND:	campofunct3 := "111";

-- Codigos funct7 en R-tipo y inst[31:25] o imm[11:5] en I-tipo
constant F7_SRAI: 	campofunct7 := "0100000";
constant F7_SUB: 	campofunct7 := "0100000";
constant F7_SRA: 	campofunct7 := "0100000";
constant F7_RESTO: 	campofunct7 := "0000000";

-- Condicion en secuenciamiento
constant COND_BEQ:	campofunct3 := "000";
constant COND_BNE:	campofunct3 := "001";

constant COND_BLT:	campofunct3 := "100"; -- enteros
constant COND_BGE:	campofunct3 := "101"; -- enteros
constant COND_BLTU:	campofunct3 := "110"; -- naturales
constant COND_BGEU:	campofunct3 := "111"; -- naturales

-- Acceso a memoria (funct3). Tamanyo. E: entero, N: natural
constant LOAD_B:	campofunct3 := "000"; -- byte
constant LOAD_H:	campofunct3 := "001"; -- 2 bytes
constant LOAD_W:	campofunct3 := "010"; -- 4 bytes, palabra

constant LOAD_BU:	campofunct3 := "100"; -- byte
constant LOAD_HU:	campofunct3 := "101"; -- 2 bytes

constant STORE_B:	campofunct3 := "000"; -- byte
constant STORE_H:	campofunct3 := "001"; -- 2 bytes
constant STORE_W:	campofunct3 := "010"; -- 4 bytes, palabra

-- Codigos de llamada a sistema.  
--constant SYS_ECALL:	std_logic_vector := "000000000000";
--constant SYS_EBREAK:std_logic_vector := "000000000001";


end package riscv32_coop_funct_pkg;

