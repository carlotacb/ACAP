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
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

use work.Rcomponentes_cam_datos_pkg.all;
use work.Rcomponentes_cam_datos_C_pkg.all;
use work.Rcomponentes_decodificador_ModSecu_relI_pkg.all;
use work.Rcomponentes_decodificador_ModSecu_relI_PreBra_pkg.all;

use work.Rcomponentes_secuenciamiento_pkg.all;
use work.Rcomponentes_secuenciamiento_C_pkg.all;
use work.Rcomponentes_secuenciamiento_PreSig_pkg.all;

entity RDeco_cam_dat_secu_C_ModSecu_relI_PreSig is
    port (reloj, pcero, B, I: std_logic;
	 		C1L1, C2L1, C1L2, C2L2, C3L1, C4L1, C3L2, C4L2: std_logic;
			instr:	in tipo_inst_busq;
			CP:		in tipo_direc_inst;
			mD_mES:	in tam_dat_camino;
			alu_dir: out tam_dat_camino;
			L2:		out tam_dat_camino;
			opMD: 	out st_opMD;
			proxCP:		out tipo_direc_inst;
			ErPre: out std_logic;
			Pred: out st_Pred;
			CoErr: out std_logic;
			MI_FR: out std_logic;
			MI_NA: out std_logic);
end RDeco_cam_dat_secu_C_ModSecu_relI_PreSig;

architecture estructural of RDeco_cam_dat_secu_C_ModSecu_relI_PreSig is

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
signal mxrelI: st_mrelI;

signal SCond: st_SCond;

signal Secu_mES: tam_dat_camino;
signal ig, me, meu: std_logic;
signal mSIC: st_mSIC;

signal L1_secu, L2_secu: tam_dat_camino;

signal t_ErPre: std_logic;
signal t_Pred: st_Pred;

begin

deco: Rdecodificador_ModSecu_relI_PreBra port map (reloj => reloj, pcero => pcero, B => B,
						instruc => instr, 
						fmtS => inmS, MSI => mSI, PBR => PBR, fmtD => inmD, mL1 => mL1, mL2 => mL2, mES => mES, mxrelI => mxrelI,
						opALU => opALU, opMD => opMD, opSEC => opSEC, SCond => SCond, CoErr => CoErr);

cam_datos: Rcamino_datos_C port map (reloj => reloj, pcero => pcero, B => B, I => I, 
								C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2,
								instr => instr, 
								CP => CP, inmD => inmD, DE => DE, MD_mES => mD_mES, Secu_mES => Secu_mES,
								PBR => PBR, mL1 => mL1, mL2 => mL2, opALU => opALU, mES => mES, L1 => L1_secu, L2 => L2_secu, alu_dir => alu_dir, mES_BR => DE); 

control: RDECS_PreSig port map (reloj => reloj, pcero => pcero, I => I,
					opSEC => opSEC, ig => ig, me => me, meu => meu, Pred => t_Pred, ErPre => t_ErPre, mSIC => mSIC);

cam_secuen: Rcamino_secuen_C_ModSecu_relI_PreSig port map (reloj => reloj, pcero => pcero, B => B, I => I, 
								CP => CP, instr => instr, inmS => inmS, mSI => mSI, L1 => L1_secu, L2 => L2_secu, mSIC => mSIC, mxrelI => mxrelI, opSEC => opSEC, SCond => SCond, ErPre => t_ErPre, ig => ig, me => me, meu => meu, Pred => t_Pred, CP_impli => Secu_mES, proxCP => proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

L2 <= L2_secu;

	ErPre <= t_ErPre;
	Pred <= t_Pred;
end;


