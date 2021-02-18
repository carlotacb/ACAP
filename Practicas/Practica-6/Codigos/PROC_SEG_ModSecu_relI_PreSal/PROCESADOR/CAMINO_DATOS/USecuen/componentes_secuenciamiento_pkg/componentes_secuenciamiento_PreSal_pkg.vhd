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

package componentes_secuenciamiento_PreSal_pkg is

component DECS_PreSal is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end component;

component PredSal is
	port(mxrelI: in st_mrelI;
		SCond: in st_SCond;
		s_Predsal: out std_logic);
end component;

end package componentes_secuenciamiento_PreSal_pkg;

