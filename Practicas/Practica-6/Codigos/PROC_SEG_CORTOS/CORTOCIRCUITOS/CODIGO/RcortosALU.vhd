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

entity RcortosALU is
	port (reloj, Pcero: std_logic;
		a, cort: in tam_dat_camino;
		selc1, selc2: std_logic;
		s: out tam_dat_camino);
end RcortosALU;

architecture estructural of RcortosALU is
signal a_RA4: tam_dat_camino;
signal c1_RM5, c2_R6: tam_dat_camino;

begin

RA4_LX: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => a, s => a_RA4);

RM5_alu: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => cort, s => c1_RM5);
R6_alu: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => c1_RM5, s => c2_R6);

RcorALU: cortos port map (a => a_RA4, c1 => c1_RM5, c2 => c2_R6, selc1 => selc1, selc2 => selc2, s => s);

end;

