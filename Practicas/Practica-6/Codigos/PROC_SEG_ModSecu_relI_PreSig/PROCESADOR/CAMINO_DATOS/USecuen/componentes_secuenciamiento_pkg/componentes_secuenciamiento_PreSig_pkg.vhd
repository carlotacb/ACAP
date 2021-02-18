--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

package componentes_secuenciamiento_PreSig_pkg is

component DECS_PreSig is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		Pred: in st_Pred;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end component;

component Pred_Sig is
	port(mxrelI: in st_mrelI;
		SCond: in st_SCond;
		Pred: in st_Pred;
		s_Predsal: out std_logic);
end component;

component predictor is
	port(inst: in tipo_inst_busq;
		Pred: out st_Pred);
end component;

end package componentes_secuenciamiento_PreSig_pkg;

