--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.RegDes_pkg.all;

entity RmL2_C is
generic (sel1: st_mL2 := mL2_REG; sel2: st_mL2 := mL2_IMM);
   port (reloj, Pcero, I: std_logic;
	d0, d1: in tam_dat_camino;
	SEL: in st_mL2;
	s: out tam_dat_camino);
end RmL2_C;

architecture estructural of RmL2_C is
signal d1_RA4: tam_dat_camino;
signal SEL_RA4: st_mL2;

begin

RA4_FMTD: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => d1, s => d1_RA4);

RA4_mL2: RDI_1 port map (reloj => reloj, pcero => pcero, I => I, e => SEL, s => SEL_RA4);

muxRmL2: mux2 generic map (sel1 => mL2_REG, sel2 => mL2_IMM)
				port map (d0 => d0, d1 => d1_RA4, SEL => SEL_RA4, s => s);
end estructural;
