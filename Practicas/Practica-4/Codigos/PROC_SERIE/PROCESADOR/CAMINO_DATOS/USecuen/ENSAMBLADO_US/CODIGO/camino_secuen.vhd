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
--! @image html camino_secuen.png

entity camino_secuen is
	port(CP:	in tipo_direc_inst;
		instr:	in tipo_inst_busq;
		inmS:	in st_fmtS;
		mSI:	in st_mSI;
		L1, L2:	in tam_dat_camino;
		mSIC: in st_mSIC;
		ig, me, meu: out std_logic;
		CP_impli: out tipo_direc_inst;
		proxCP:	out tipo_direc_inst;
		MI_FR: out std_logic;
		MI_NA: out std_logic);
end camino_secuen;

architecture estructural of camino_secuen is

signal cuatro_sum: tipo_direc_inst;
signal inter_CP_impli: tipo_direc_inst;
signal fmts_sum: tipo_direc_inst;
signal mSI_sum: tipo_direc_inst;
signal sum_mSIC: tipo_direc_inst;
signal t_proxCP: tipo_direc_inst;

begin

ctecuatro: cuatro port map(tamI => cuatro_sum);

sumcuatro: sumador port map(a => CP, b => cuatro_sum, s => inter_CP_impli);

formatearS: FMTS port map(instr => instr, inmS => inmS, inmediato => fmts_sum);

muxrelatindex: muxdirec generic map (sel1 => mSI_CP, sel2 => mSI_REG)
				port map(d0 => CP, d1 => L1, SEL => mSI, s => mSI_sum);

sumrelatindex: sum_secu port map(a => mSI_sum, b => fmts_sum, sel => mSI, s => sum_mSIC);

evaluar: eval port map (L1 => L1, L2 => L2, ig => ig, me => me, meu => meu);

muxsecuen: muxdirec generic map (sel1 => mSIC_IMPL, sel2 => mSIC_MOD)
				port map(d0 => inter_CP_impli, d1 => sum_mSIC, SEL => mSIC, s => t_proxCP);

CP_impli <= inter_CP_impli;

compro_acc: acceso_MI port map(direccion => t_proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

proxCP <= t_proxCP;

end;


