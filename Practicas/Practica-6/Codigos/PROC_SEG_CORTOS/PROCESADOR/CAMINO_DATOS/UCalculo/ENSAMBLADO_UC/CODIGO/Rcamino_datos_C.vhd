--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.retardos_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.Rcomponentes_cam_datos_pkg.all;
use work.Rcomponentes_cam_datos_C_pkg.all;
use work.Rcomponentes_cortos_pkg.all;
--! @image html Rcamino_datos_C.jpg

entity Rcamino_datos_C is
    port (reloj, pcero, B, I: std_logic;
			C1L1, C2L1, C1L2, C2L2, C3L1, C4L1, C3L2, C4L2: std_logic;
			instr:	in tipo_inst_busq;
			CP:		in tam_dat_camino;
			inmD:	in st_fmtD;
			DE:	in tam_dat_camino;
			MD_mES:	in tam_dat_camino;
			Secu_mES:	in tam_dat_camino;
			PBR:		in st_PBR;
			mL1:	in st_mL1;
			mL2:	in st_mL2;
			opALU: 	in  st_opALU;
			mES:		in st_mES;
			L1:		out tam_dat_camino;
			L2:		out tam_dat_camino;
			alu_dir: out tam_dat_camino;
			mES_BR: out tam_dat_camino);
end Rcamino_datos_C;

architecture estructural of Rcamino_datos_C is

signal BR_mL1, BR_mL2: tam_dat_camino;
signal IMM_mL2: tam_dat_camino;
signal mL1_alu_A, mL2_alu_B: tam_dat_camino;
signal salu: tam_dat_camino;

signal L1_corto_BR, L2_corto_BR: tam_dat_camino;
signal L1_corto, L2_corto: tam_dat_camino;
signal t_mES_BR: tam_dat_camino;

constant CERO: tam_dat_camino:= (others => '0');

alias IDE: dir_reg is instr(11 downto 7);
alias IDL2: dir_reg is instr(24 downto 20);
alias IDL1: dir_reg is instr(19 downto 15);

begin 

form_dat: RFMTD port map (reloj => reloj, pcero => pcero, B => B, instr => instr, inmD => inmD, inmediato => IMM_mL2);

banco_registros: RBR port map(reloj => reloj, pcero => pcero, B => B, I => I, IDL1 => IDL1, IDL2 => IDL2, L1 => BR_mL1, L2 => BR_mL2, IDE => IDE, DE => DE, PE => PBR);

BR_L1_corto: RcortosDL port map (reloj => reloj, pcero => pcero, a => BR_mL1, cort => t_mES_BR, selc1 => C3L1, selc2 => C4L1, s => L1_corto_BR);-- DE, mES_BR
BR_L2_corto: RcortosDL port map (reloj => reloj, pcero => pcero, a => BR_mL2, cort => t_mES_BR, selc1 => C3L2, selc2 => C4L2, s => L2_corto_BR);

ALU_L1_corto: RcortosALU port map (reloj => reloj, pcero => pcero, a => L1_corto_BR, cort => salu, selc1 => C1L1, selc2 => C2L1, s => L1_corto);
ALU_L2_corto: RcortosALU port map(reloj => reloj, pcero => pcero, a => L2_corto_BR, cort => salu, selc1 => C1L2, selc2 => C2L2, s => L2_corto);


muxL1: RmL1_C generic map (sel1 => mL1_REG, sel2 => mL1_CP, sel3 => mL1_CERO)
				port map(reloj => reloj, pcero => pcero, B => B, I => I, d0 => L1_corto, d1 => CP, d2 => CERO, SEL => mL1, s => mL1_alu_A);

muxL2: RmL2_C generic map(sel1 => mL2_REG, sel2 => mL2_IMM)
				port map(reloj => reloj, pcero => pcero, I => I, d0 => L2_corto, d1 => IMM_mL2, SEL => mL2, s => mL2_alu_B);
 
alu_map: Ralu port map(reloj => reloj, pcero => pcero, I => I, opALU => opALU, a => mL1_alu_A, b => mL2_alu_B, s => salu);

muxmES: RmES generic map (sel1 => mES_ALU, sel2 => mES_MEM, sel3 => mES_RET)
				port map(reloj => reloj, pcero => pcero, B => B, I => I, d0 => salu, d1 => MD_mES, d2 => Secu_mES, SEL => mES, s => t_mES_BR);

L1 <= L1_corto;
L2 <= L2_corto;
alu_dir <= salu;
mES_BR <= t_mES_BR;

end;
