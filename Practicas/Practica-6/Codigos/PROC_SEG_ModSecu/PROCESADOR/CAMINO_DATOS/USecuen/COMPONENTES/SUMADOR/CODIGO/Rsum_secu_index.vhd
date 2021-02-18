--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.Rcomponentes_secuenciamiento_C_ModSecu_pkg.all;
use work.RegDes_pkg.all;

entity Rsum_secu_index is 
	port(reloj, pcero: in std_logic;
		a, b: in tipo_direc_inst;
		s: out tipo_direc_inst);
end Rsum_secu_index;

architecture estructural of Rsum_secu_index is
signal b_RA4: tipo_direc_inst;

begin
RA4_FMTS: RD_N generic map (tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => b, s => b_RA4);

sum_secu_ind: sum_index port map (a => a, b => b_RA4, s => s);

end;
