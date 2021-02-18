--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

use work.componentes_secuenciamiento_PreSig_pkg.all;
use work.RegDes_pkg.all;

entity Rpredictor is
	port(reloj, pcero, B: in std_logic;
		inst: in tipo_inst_busq;
		Pred: out st_Pred);
end Rpredictor;

architecture comporta of Rpredictor is
constant signo_inmS: integer:= 31;
signal inst_RDL3: tipo_inst_busq;

begin
RDL3_inst: RDB_N generic map (tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, B => B, e => inst, s => inst_RDL3);

pred_sentido: predictor port map (inst => inst_RDL3, Pred => Pred);
end;
