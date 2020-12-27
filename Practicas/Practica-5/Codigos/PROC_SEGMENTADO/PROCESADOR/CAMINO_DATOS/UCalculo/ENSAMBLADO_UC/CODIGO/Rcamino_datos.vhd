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
--! @image html Rcamino_datos.png

entity Rcamino_datos is
    port (reloj, pcero, B, I: std_logic;
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
end Rcamino_datos;

architecture estructural of Rcamino_datos is

signal BR_mL1, BR_mL2: tam_dat_camino;
signal IMM_mL2: tam_dat_camino;
signal mL1_alu_A, mL2_alu_B: tam_dat_camino;
signal salu: tam_dat_camino;

constant CERO: tam_dat_camino:= (others => '0');

alias IDE: dir_reg is instr(11 downto 7);
alias IDL2: dir_reg is instr(24 downto 20);
alias IDL1: dir_reg is instr(19 downto 15);

begin 

form_dat: RFMTD port map (reloj => reloj, pcero => pcero, B => B, instr => instr, inmD => inmD, inmediato => IMM_mL2);

banco_registros: RBR port map(reloj => reloj, pcero => pcero, B => B, I => I, IDL1 => IDL1, IDL2 => IDL2, L1 => BR_mL1, L2 => BR_mL2, IDE => IDE, DE => DE, PE => PBR);

muxL1: RmL1 generic map (sel1 => mL1_REG, sel2 => mL1_CP, sel3 => mL1_CERO)
				port map(reloj => reloj, pcero => pcero, B => B, I => I, d0 => BR_mL1, d1 => CP, d2 => CERO, SEL => mL1, s => mL1_alu_A);

muxL2: RmL2 generic map(sel1 => mL2_REG, sel2 => mL2_IMM)
				port map(reloj => reloj, pcero => pcero, I => I, d0 => BR_mL2, d1 => IMM_mL2, SEL => mL2, s => mL2_alu_B);
 
alu_map: Ralu port map(reloj => reloj, pcero => pcero, I => I, opALU => opALU, a => mL1_alu_A, b => mL2_alu_B, s => salu);

muxmES: RmES generic map (sel1 => mES_ALU, sel2 => mES_MEM, sel3 => mES_RET)
				port map(reloj => reloj, pcero => pcero, B => B, I => I, d0 => salu, d1 => MD_mES, d2 => Secu_mES, SEL => mES, s => mES_BR);

L1 <= BR_mL1;
L2 <= BR_mL2;
alu_dir <= salu;

end;
