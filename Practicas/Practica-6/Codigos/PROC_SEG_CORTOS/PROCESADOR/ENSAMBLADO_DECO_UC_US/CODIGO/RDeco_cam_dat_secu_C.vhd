--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.Rcomponentes_cam_datos_pkg.all;
use work.Rcomponentes_cam_datos_C_pkg.all;
use work.Rcomponentes_decodificador_pkg.all;
use work.Rcomponentes_secuenciamiento_pkg.all;
use work.Rcomponentes_secuenciamiento_C_pkg.all;

entity RDeco_cam_dat_secu_C is
    port (reloj, pcero, B, I: std_logic;
	 		C1L1, C2L1, C1L2, C2L2, C3L1, C4L1, C3L2, C4L2: std_logic;
			instr:	in tipo_inst_busq;
			CP:		in tipo_direc_inst;
			mD_mES:	in tam_dat_camino;
			alu_dir: out tam_dat_camino;
			L2:		out tam_dat_camino;
			opMD: 	out st_opMD;
			proxCP:		out tipo_direc_inst;
			CoErr: out std_logic;
			MI_FR: out std_logic;
			MI_NA: out std_logic);
end RDeco_cam_dat_secu_C;

architecture estructural of RDeco_cam_dat_secu_C is

signal inmS: st_fmtS;
signal mSI: st_MSI;
signal PBR: st_PBR;
signal inmD: st_fmtD;
signal DE: tam_dat_camino;
signal mL1: st_mL1;
signal mL2: st_mL2;
signal opALU: st_opALU;
signal opSEC: st_opSEC;
signal mES: st_MES;

signal Secu_mES: tam_dat_camino;
signal ig, me, meu: std_logic;
signal mSIC: st_mSIC;

signal L1_secu, L2_secu: tam_dat_camino;


begin

deco: Rdecodificador port map (reloj => reloj, pcero => pcero, B => B,
						instruc => instr, 
						fmtS => inmS, MSI => mSI, PBR => PBR, fmtD => inmD, mL1 => mL1, mL2 => mL2, mES => mES,
						opALU => opALU, opMD => opMD, opSEC => opSEC, CoErr => CoErr);

cam_datos: Rcamino_datos_C port map (reloj => reloj, pcero => pcero, B => B, I => I, 
								C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2,
								instr => instr, 
								CP => CP, inmD => inmD, DE => DE, MD_mES => mD_mES, Secu_mES => Secu_mES,
								PBR => PBR, mL1 => mL1, mL2 => mL2, opALU => opALU, mES => mES, L1 => L1_secu, L2 => L2_secu, alu_dir => alu_dir, mES_BR => DE); -- mES_BR => t_mES_BR

control: RDECS port map (reloj => reloj, pcero => pcero, I => I,
					opSEC => opSEC, ig => ig, me => me, meu => meu, mSIC => mSIC);

cam_secuen: Rcamino_secuen_C port map (reloj => reloj, pcero => pcero, B => B, I => I, 
								CP => CP, instr => instr, inmS => inmS, mSI => mSI, L1 => L1_secu, L2 => L2_secu, mSIC => mSIC, opSEC => opSEC, ig => ig, me => me, meu => meu, CP_impli => Secu_mES, proxCP => proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

L2 <= L2_secu;

end;


