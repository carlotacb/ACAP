--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.param_disenyo_pkg.all;
use work.componentes_cortos_pkg.all;
use work.RegDes_pkg.all;

entity RcortosDL is
	port (reloj, Pcero: std_logic;
		a, cort: in tam_dat_camino;
		selc1, selc2: std_logic;
		s: out tam_dat_camino);
end RcortosDL;

architecture estructural of RcortosDL is
signal c2_R7: tam_dat_camino;

begin
R7_ES: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => cort, s => c2_R7);

RcorALU: cortos port map (a => a, c1 => cort, c2 => c2_R7, selc1 => selc1, selc2 => selc2, s => s);

end;

