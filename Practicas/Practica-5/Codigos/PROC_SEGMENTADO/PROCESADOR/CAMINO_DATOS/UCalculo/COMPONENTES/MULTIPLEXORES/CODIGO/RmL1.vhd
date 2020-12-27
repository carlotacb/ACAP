--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.retardos_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.RegDes_pkg.all;
--! @image html RmL1.png

entity RmL1 is
generic (sel1: st_mL1 := mL1_REG; sel2: st_mL1 := mL1_CP; sel3: st_mL1 := mL1_CERO);
   port (reloj, pcero, B, I: in std_logic;
	d0, d1, d2: in tam_dat_camino;
	SEL: in st_mL1;
	s: out tam_dat_camino);
end RmL1;

architecture estructural of RmL1 is
signal d1_DL3, d1_RA4: tam_dat_camino;
signal d0_RA4: tam_dat_camino;
signal SEL_RA4: st_mL1;

begin

RDL3_CP: RDB_N generic map (tam => tam_direcc)
				port map (reloj => reloj, pcero => pcero, B => B, e => d1, s => d1_DL3); 
RA4_CP: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => d1_DL3, s => d1_RA4);

RA4_L1: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => d0, s => d0_RA4);

RA4_mL1: RDI_N generic map(tam => num_mL1)
			port map (reloj => reloj, pcero => pcero, I => I, e => SEL, s => SEL_RA4);

muxRmL1: mux3 generic map (sel1 => mL1_REG, sel2 => mL1_CP, sel3 => mL1_CERO)
				port map(d0 => d0_RA4, d1 => d1_RA4, d2 => d2, SEL => SEL_RA4, s => s);

end estructural;
