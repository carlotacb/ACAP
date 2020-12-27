--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_pkg.all;

entity DECS_camino_secuen is
	port(CP:	in tipo_direc_inst;
		instr:	in tipo_inst_busq;
		inmS:	in st_fmtS;
		mSI:	in st_mSI;
		L1, L2:	in tam_dat_camino;
		opSEC: in st_opSEC;
		CP_impli: out tipo_direc_inst;
		proxCP:	out tipo_direc_inst;
		MI_FR: out std_logic;
		MI_NA: out std_logic);
end DECS_camino_secuen;

architecture estructural of DECS_camino_secuen is

signal ig, me, meu : std_logic;
signal mSIC: st_mSIC;
signal t_proxCP: tipo_direc_inst;

begin
control: DECS port map (opSEC => opSEC, ig => ig, me => me, meu => meu, mSIC => mSIC);

cam_secuen: camino_secuen port map (CP => CP, instr => instr, inmS => inmS, mSI => mSI, L1 => L1, L2 => L2, mSIC => mSIC, ig => ig, me => me, meu => meu, CP_impli => CP_impli, proxCP => proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

--compro_acc: acceso_MI port map(direccion => t_proxCP, MI_FR => MI_FR, MI_NA => MI_NA);

--proxCP <= t_proxCP;

end;


