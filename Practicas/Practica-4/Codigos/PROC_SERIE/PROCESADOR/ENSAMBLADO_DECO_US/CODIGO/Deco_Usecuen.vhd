--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
--use work.retardos.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.componentes_decodificador_pkg.all;
use work.componentes_secuenciamiento_pkg.all;


entity Deco_Usecuen is
    port (instr:	in tipo_inst_busq;
			CP:		in tipo_direc_inst;
			L1:		in tam_dat_camino;
			L2:		in tam_dat_camino;
			proxCP:		out tipo_direc_inst;
			CP_return:	out tipo_direc_inst;
			MI_FR: out std_logic;
			MI_NA: out std_logic);
end Deco_Usecuen;

architecture estructural of Deco_Usecuen is

signal inmS: st_fmtS;
signal mSI: st_MSI;
signal opSEC: st_opSEC;

signal Secu_mES: tam_dat_camino;
signal ig, me, meu: std_logic;
signal mSIC: st_mSIC;

signal L1_secu, L2_secu: tam_dat_camino;

begin

deco: decodificador port map (instruc => instr, 
						fmtS => inmS, MSI => mSI, PBR => open, fmtD => open, mL1 => open, mL2 => open, mES => open,
						opALU => open, opMD => open, opSEC => opSEC, CoErr => open);

control: DECS port map (opSEC => opSEC, ig => ig, me => me, meu => meu, mSIC => mSIC);

cam_secuen: camino_secuen port map (CP => CP, instr => instr, inmS => inmS, mSI => mSI, L1 => L1, L2 => L2, mSIC => mSIC, ig => ig, me => me, meu => meu, CP_impli => CP_return, proxCP => proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

end;


