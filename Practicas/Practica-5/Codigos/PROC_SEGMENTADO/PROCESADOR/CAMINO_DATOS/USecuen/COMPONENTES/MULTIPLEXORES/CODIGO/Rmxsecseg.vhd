--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_pkg.all;
use work.RegDes_pkg.all;
--! @image html Rmsecuseg.png

entity Rmxsecseg is
generic (sel1: st_msecseg := msecseg_IMPL; sel2: st_msecseg := msecseg_ISECU);
   port (reloj, pcero, I: in std_logic;
	d0, d1: in tipo_direc_inst;
	opSEC: in st_opSEC;
	s: out tipo_direc_inst);
end Rmxsecseg;

architecture estructural of Rmxsecseg is
signal opSEC_A4: st_opSEC;

begin

RA4_opSEC: RDI_N generic map (tam => num_opSEC)
			port map (reloj => reloj, pcero => pcero, I => I, e => opSEC, s => opSEC_A4);

R_msecseg: muxdirec generic map (sel1 => msecseg_IMPL, sel2 => msecseg_ISECU)
				port map (d0 => d0, d1 => d1, SEL => opSEC_A4(3), s => s);

end estructural;

