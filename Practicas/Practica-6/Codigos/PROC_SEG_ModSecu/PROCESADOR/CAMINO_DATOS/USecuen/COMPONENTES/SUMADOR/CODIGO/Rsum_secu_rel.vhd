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

entity Rsum_secu_rel is 
	port(reloj, pcero, B: in std_logic;
		a, b_e: in tipo_direc_inst;
		s: out tipo_direc_inst);
end Rsum_secu_rel;

architecture estructural of Rsum_secu_rel is
signal a_RDL3: tipo_direc_inst;

begin
RDL3_CP: RDB_N generic map (tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, B => B, e => a, s => a_RDL3);

R_sum_secu: sumador port map (a => a_RDL3, b => b_e, s => s);

end;
