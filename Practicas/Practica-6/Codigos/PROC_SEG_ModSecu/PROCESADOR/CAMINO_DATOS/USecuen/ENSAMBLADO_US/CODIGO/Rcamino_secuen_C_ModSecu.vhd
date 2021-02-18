--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_pkg.all;
use work.Rcomponentes_secuenciamiento_pkg.all;
use work.Rcomponentes_secuenciamiento_C_pkg.all;
use work.Rcomponentes_secuenciamiento_C_ModSecu_pkg.all;
use work.RegDes_pkg.all;
--! @image html Rcamino_secuen_C_ModSecu.jpg

entity Rcamino_secuen_C_ModSecu is
	port(reloj, pcero, B, I: in std_logic;
		CP:	in tipo_direc_inst;
		instr:	in tipo_inst_busq;
		inmS:	in st_fmtS;
		mSI:	in st_mSI;
		L1, L2:	in tam_dat_camino;
		mSIC: in st_mSIC;
		opSEC:	in  st_opSEC;
		ig, me, meu: out std_logic;
		CP_impli: out tipo_direc_inst;
		proxCP:	out tipo_direc_inst;
		MI_FR: out std_logic;
		MI_NA: out std_logic);
end Rcamino_secuen_C_ModSecu;

architecture estructural of Rcamino_secuen_C_ModSecu is

signal cuatro_sum: tipo_direc_inst;
signal inter_CP_impli: tipo_direc_inst;
signal fmts_sum: tipo_direc_inst;
signal mSI_mSIC: tipo_direc_inst;
signal sal_sum_mSIC, sum_index: tipo_direc_inst;
signal t_proxCP: tipo_direc_inst;
signal sum_rela: tipo_direc_inst;

begin

ctecuatro: cuatro port map(tamI => cuatro_sum);

sumcuatro: sumador port map(a => CP, b => cuatro_sum, s => inter_CP_impli);

formatearS: RFMTS port map(reloj => reloj, pcero => pcero, B => B, instr => instr, inmS => inmS, inmediato => fmts_sum);

sumrelat: Rsum_secu_rel port map(reloj => reloj, pcero => pcero, B => B, a => CP, b_e => fmts_sum, s => sum_rela);

sumindex: Rsum_secu_index port map(reloj => reloj, pcero => pcero, a => L1, b => fmts_sum, s => sum_index);

muxrelatindex: Rmuxdirec_C_ModSecu generic map (sel1 => mSI_CP, sel2 => mSI_REG)
				port map(reloj => reloj, pcero => pcero, I => I, d0 => sum_rela, d1 => sum_index, SEL => mSI, s => mSI_mSIC);

evaluar: eval port map (L1 => L1, L2 => L2, ig => ig, me => me, meu => meu);

nuxSIC: RmuxmSIC generic map (sel1 => mSIC_IMPL, sel2 => mSIC_MOD)		--
				port map (reloj => reloj, pcero => pcero, B => B, d0 => inter_CP_impli, d1 => mSI_mSIC, SEL => mSIC, s => sal_sum_mSIC);	--

 mxsecseg: Rmxsecseg generic map (sel1 => msecseg_IMPL, sel2 => msecseg_ISECU)
				port map (reloj => reloj, pcero => pcero, I => I, d0 => inter_CP_impli, d1 => saL_sum_mSIC, opSEC => opSEC, s => t_proxCP);

CP_impli <= inter_CP_impli;

compro_acc: acceso_MI port map(direccion => t_proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

proxCP <= t_proxCP;

end;


