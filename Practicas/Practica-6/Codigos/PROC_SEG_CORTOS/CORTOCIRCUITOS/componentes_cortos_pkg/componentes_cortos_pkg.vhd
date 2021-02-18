--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_cortos_pkg is

component cortos is
	port (a, c1 , c2: in tam_dat_camino;
		selc1, selc2: std_logic;
		s: out tam_dat_camino);
end component;

end package componentes_cortos_pkg;
