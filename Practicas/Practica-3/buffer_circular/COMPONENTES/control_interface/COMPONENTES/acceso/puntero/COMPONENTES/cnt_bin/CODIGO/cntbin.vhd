--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;
--! @image html cntbin.png 

entity cntbin is 
port (ent: in st_puntero;
	sal: out st_puntero);
end cntbin;

architecture compor of cntbin is
begin

	sal <= std_logic_vector(unsigned(ent) + 1) after regcnt;

end compor;

