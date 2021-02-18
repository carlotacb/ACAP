--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.param_disenyo_pkg.all;
use work.componentes_cam_datos_pkg.all;

entity cortos is
	port (a, c1 , c2: in tam_dat_camino;
		selc1, selc2: std_logic;
		s: out tam_dat_camino);
end cortos;

architecture estructural of cortos is
signal scorto2: tam_dat_camino;
signal t_s: tam_dat_camino;

begin

mcorto2: mux2 generic map (sel1 => '0', sel2 => '1')
				port map (d0 => a, d1 => c2, SEL => selc2, s => scorto2);

mcorto1: mux2 generic map (sel1 => '0', sel2 => '1')
				port map (d0 => scorto2, d1 => c1, SEL => selc1, s => t_s);

s <= t_s;
end;

