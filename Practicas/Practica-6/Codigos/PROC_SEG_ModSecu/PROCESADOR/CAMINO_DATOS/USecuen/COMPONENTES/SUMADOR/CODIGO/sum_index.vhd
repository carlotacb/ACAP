--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.retardos_pkg.all;

entity sum_index is 
	port(a, b: in tipo_direc_inst;
		s: out tipo_direc_inst);
end sum_index;

architecture comportamiento of sum_index is
signal st: tipo_direc_inst;
begin
	st <= std_logic_vector(unsigned(a) + unsigned(b)) after retSUMADOR;
	s <= st(st'length-1 downto 1) & '0';
end;
