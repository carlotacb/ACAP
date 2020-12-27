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
use work.RegDes_pkg.all;
use work.componentes_cam_datos_pkg.all;

entity RmES is
generic (sel1: st_mES := mES_ALU; sel2: st_mES := mES_MEM; sel3: st_mES := mES_RET); 
   port (reloj, pcero, B, I: in std_logic;
	d0, d1, d2: in tam_dat_camino;
	SEL: in st_mL1;
	s: out tam_dat_camino);
end RmES;
--! @image html RmES.png

architecture estructural of RmES is
signal SEL_A4, SEL_M5, SEL_6: st_mL1;
signal d0_M5, d0_6: tam_dat_camino;
signal d2_DL3, d2_A4, d2_M5, d2_6: tam_dat_camino;

begin

RA4_mES: RDI_N generic map(tam => num_mES)
			port map (reloj => reloj, pcero => pcero, I => I, e => SEL, s => SEL_A4);
RM5_mES: RD_N generic map(tam => num_mES)
			port map (reloj => reloj, pcero => pcero, e => SEL_A4, s => SEL_M5);
R6_mES: RD_N generic map(tam => num_mES)
			port map (reloj => reloj, pcero => pcero, e => SEL_M5, s => SEL_6);

RM5_alu: RD_D port map (reloj => reloj, e => d0, s => d0_M5);
R6_alu: RD_D port map (reloj => reloj, e => d0_M5, s => d0_6);

RDL3_CPret: RDB_N port map (reloj => reloj, pcero => pcero, B => B, e => d2, s => d2_DL3);
RA4_CPret: RD_D port map (reloj => reloj, e => d2_DL3, s => d2_A4);
RM5_CPret: RD_D port map (reloj => reloj, e => d2_A4, s => d2_M5);
R6_CPret: RD_D port map (reloj => reloj, e => d2_M5, s => d2_6);

muxRmES: mux3 generic map (sel1 => mES_ALU, sel2 => mES_MEM, sel3 => mES_RET)
				port map(d0 => d0_6, d1 => d1, d2 => d2_6, SEL => SEL_6, s => s);

end estructural;
