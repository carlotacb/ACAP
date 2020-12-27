--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.componentes_secuenciamiento_pkg.all;
use work.RegDes_pkg.all;
--! @image html REVAL.png

entity Reval is
	port(reloj, pcero: in std_logic;
		L1, L2:	in  tam_dat_camino;
		ig, me, meu:	out std_logic );
end Reval;

architecture estructural of Reval is
signal L1_RA4, L2_RA4: tam_dat_camino;

begin

RA4_L1: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => L1, s => L1_RA4);
			
RA4_L2: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => L2, s => L2_RA4);


R_eval: eval port map (L1 => L1_RA4, L2 => L2_RA4, ig => ig, me => me, meu => meu);

end;
