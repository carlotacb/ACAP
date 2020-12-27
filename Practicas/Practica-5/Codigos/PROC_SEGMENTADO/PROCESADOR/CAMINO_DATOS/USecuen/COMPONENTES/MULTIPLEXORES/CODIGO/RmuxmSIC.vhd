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
--! @image html RmSIC.png

entity RmuxmSIC is
generic (sel1: st_mSIC := mSIC_IMPL; sel2: st_mSIC := mSIC_MOD);
   port (reloj, pcero, B: in std_logic;
	d0, d1: in tipo_direc_inst;
	SEL: in st_mSIC;
	s: out tipo_direc_inst);
end RmuxmSIC;

architecture estructural of RmuxmSIC is
signal d0_DL3, d0_A4: tipo_direc_inst;

begin

RDL3_CP4: RDB_N port map (reloj => reloj, pcero => pcero, B => B, e => d0, s => d0_DL3);

RA4_CP4: RD_D port map (reloj => reloj, e => d0_DL3, s => d0_A4);

R_mSIC: muxdirec generic map (sel1 => mSIC_IMPL, sel2 => mSIC_MOD)
				port map (d0 => d0_A4, d1 => d1, SEL => SEL, s => s);

end estructural;
