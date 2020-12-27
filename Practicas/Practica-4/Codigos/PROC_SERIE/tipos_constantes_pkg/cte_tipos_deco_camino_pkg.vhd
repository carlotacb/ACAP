--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_deco_camino_pkg is

-- subtipos y constantes utilizadas para el control del camino de datos
-- y operacion en el mismo de una instruccion

subtype st_PBR is std_logic;				-- banco de registros

constant num_fmtD: natural:= 2;
subtype st_fmtD is std_logic_vector(num_fmtD-1 downto 0);	-- formateador FMT

constant num_mL1: natural:= 2;
subtype st_mL1 is  std_logic_vector(num_mL1-1 downto 0);	-- multiplexor mL1

subtype st_mL2 is std_logic;				-- multiplexor mL2

constant num_mES: natural:= 2;
subtype st_mES is std_logic_vector(num_mES-1 downto 0);	-- multiplexor mES

subtype st_PMEM is std_logic;				-- memoria de datos

constant num_fmtS: natural:= 2;
subtype st_fmtS is std_logic_vector(num_fmtS-1 downto 0);	-- formateador FMTI

subtype st_mSI is std_logic;				-- multiplexor mSI

subtype st_mSIC is std_logic;				-- multiplexor mSC

constant num_optALU: natural:= 5;
subtype st_opALU is std_logic_vector(num_optALU-1 downto 0);		-- control en ALU

constant num_opMD: natural:= 5;
subtype st_opMD is std_logic_vector(num_opMD-1 downto 0);		-- control en MD

constant num_opSEC: natural:= 4;
subtype st_opSEC is std_logic_vector(num_opSEC-1 downto 0);		-- control en secuen.

constant PBR_si: st_PBR:= '1';
constant PBR_no: st_PBR:= '0';

constant fmtD_U: st_fmtD:= "00";
constant fmtD_I: st_fmtD:= "01";
constant fmtD_S: st_fmtD:= "10";
constant fmtD_IRRE: st_fmtD:= "00";

constant mL1_REG: st_mL1:= std_logic_vector(to_unsigned(0,2)); --"00";
constant mL1_CP: st_mL1:= std_logic_vector(to_unsigned(1,2)); --"01";
constant mL1_CERO: st_mL1:= std_logic_vector(to_unsigned(2,2)); --"10";
constant mL1_IRRE: st_mL1:= std_logic_vector(to_unsigned(0,2)); --"00";

constant mL2_REG: st_mL2:= '0';
constant mL2_IMM: st_mL2:= '1';
constant mL2_IRRE: st_mL2:= '0';

constant mES_ALU: st_mES:= std_logic_vector(to_unsigned(0,2)); --"00";
constant mES_MEM: st_mES:= std_logic_vector(to_unsigned(1,2)); --"01";
constant mES_RET: st_mES:= std_logic_vector(to_unsigned(2,2)); --"10";
constant mES_IRRE: st_mES:= std_logic_vector(to_unsigned(0,2)); --"00";

constant PMEM_si: st_PMEM:= '1';
constant PMEM_no: st_PMEM:= '0';

constant fmtS_B: st_fmtS:= "00";
constant fmtS_I: st_fmtS:= "01";
constant fmtS_J: st_fmtS:= "10";
constant fmtS_IRRE: st_fmtS:= "00";

constant mSI_CP: st_mSI:= '0';
constant mSI_REG: st_mSI:= '1';
constant mSI_IRRE: st_mSI:= '0';

constant mSIC_IMPL: st_mSIC:= '0';				
constant mSIC_MOD: st_mSIC:= '1';

end package cte_tipos_deco_camino_pkg;

