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

entity predictor is
	port(inst: in tipo_inst_busq;
		Pred: out st_Pred);
end predictor;

architecture comporta of predictor is
constant signo_inmS: integer:= 31;

begin
	Pred <= inst(signo_inmS);
end;
