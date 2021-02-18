--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package Rcomponentes_cortos_pkg is

component RcortosALU is
	port (reloj, Pcero: std_logic;
		a, cort: in tam_dat_camino;
		selc1, selc2: std_logic;
		s: out tam_dat_camino);
end component;

component RcortosDL is
	port (reloj, Pcero: std_logic;
		a, cort: in tam_dat_camino;
		selc1, selc2: std_logic;
		s: out tam_dat_camino);
end component;

end package Rcomponentes_cortos_pkg;
