--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;

package componentes_secuenciamiento_PreSecu_pkg is

component DECS_PreSecu is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end component;

component ErrelI is
	port(mxrelI: in st_mrelI;
		ErPre: in std_logic;
		s_mrelI: out std_logic);
end component;

component Ersec is
	port(opSEC:	in  st_opSEC;
		ErPre: in std_logic;
		msecuseg: out std_logic);
end component;

end package componentes_secuenciamiento_PreSecu_pkg;

