--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.retardos_pkg.all;

entity slt is
    port (men: in std_logic;
          s	: out tam_dat_camino);
end slt;

architecture compor of slt is

begin

	s <= (tam_dat-1 downto 1 => '0', 0 => men);
	
end;
