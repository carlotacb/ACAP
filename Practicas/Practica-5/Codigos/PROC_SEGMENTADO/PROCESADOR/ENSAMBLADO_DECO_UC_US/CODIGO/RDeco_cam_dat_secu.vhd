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
use work.Rcomponentes_decodificador_pkg.all;
use work.Rcomponentes_secuenciamiento_pkg.all;
--! @image html Deco_cam_dat_secu.png

entity RDeco_cam_dat_secu is
    port (reloj, pcero, B, I: std_logic;
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
end RDeco_cam_dat_secu;

architecture estructural of RDeco_cam_dat_secu is

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

cam_datos: Rcamino_datos port map (reloj => reloj, pcero => pcero, B => B, I => I, instr => instr, 
								CP => CP, inmD => inmD, DE => DE, MD_mES => mD_mES, Secu_mES => Secu_mES,
								PBR => PBR, mL1 => mL1, mL2 => mL2, opALU => opALU, mES => mES, L1 => L1_secu, L2 => L2_secu, alu_dir => alu_dir, mES_BR => DE); 

control: RDECS port map (reloj => reloj, pcero => pcero, I => I,
					opSEC => opSEC, ig => ig, me => me, meu => meu, mSIC => mSIC);

cam_secuen: Rcamino_secuen port map (reloj => reloj, pcero => pcero, B => B, I => I, 
								CP => CP, instr => instr, inmS => inmS, mSI => mSI, L1 => L1_secu, L2 => L2_secu, mSIC => mSIC, opSEC => opSEC, ig => ig, me => me, meu => meu, CP_impli => Secu_mES, proxCP => proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

L2 <= L2_secu;

end;


