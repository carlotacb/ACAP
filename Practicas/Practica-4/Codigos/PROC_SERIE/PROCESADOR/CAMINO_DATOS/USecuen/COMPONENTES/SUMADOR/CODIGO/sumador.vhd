--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity sumador is 
	port(a, b: in tipo_direc_inst;
		s: out tipo_direc_inst);
end sumador;

architecture comportamiento of sumador is
begin
	s <= std_logic_vector(unsigned(a) + unsigned(b)) after retSUMADOR;
end;
