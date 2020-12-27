--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.RegDes_pkg.all;
--! @image html RALU.png
 
entity Ralu is
    port (reloj, pcero, I: in std_logic;
			opALU : in  st_opALU;
			a	: in  tam_dat_camino;
			b	: in  tam_dat_camino;
			s	: out tam_dat_camino);
end Ralu;

architecture compor of Ralu is
signal a_RA4, b_RA4: tam_dat_camino;
signal opALU_RA4: st_opALU;

begin 

RA4_opALU: RDI_N generic map(tam => num_optALU)
			port map (reloj => reloj, pcero => pcero, I => I, e => opALU, s => opALU_RA4);

R_alu: alu port map (opALU => opALU_RA4, a => a, b => b, s => s);

end;
