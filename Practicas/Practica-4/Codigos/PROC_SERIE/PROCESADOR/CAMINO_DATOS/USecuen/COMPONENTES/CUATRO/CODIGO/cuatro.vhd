--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;

entity cuatro is 
	port(tamI: out	tipo_direc_inst);
end cuatro;

architecture comportamiento of cuatro is
begin
  tamI <= std_logic_vector(to_unsigned(4,tamI'length));
end comportamiento;
