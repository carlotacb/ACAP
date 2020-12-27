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
--! @image html Rsumsecu.png

entity Rsum_secu is 
	port(reloj, pcero, I: in std_logic;
		a, b: in tipo_direc_inst;
		sel: in st_mSI;
		s: out tipo_direc_inst);
end Rsum_secu;

architecture estructural of Rsum_secu is
signal b_RA4: tipo_direc_inst;
signal sel_RA4: st_mSI;

begin
RA4_FMTS: RD_N generic map (tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => b, s => b_RA4);

RA4_mSI: RDI_1 port map (reloj => reloj, pcero => pcero, I => I, e => sel, s => sel_RA4);

R_sum_secu: sum_secu port map (a => a, b => b_RA4, sel => sel_RA4, s => s);

end;
