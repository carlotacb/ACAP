--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LGR is
	port(RID, RS : in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LGR;


architecture comportamiento of LGR is

begin

	bloqCP <= '0' after retLGR;
	bloqBDL <= '0' after retLGR;

	inyecDLA <= '0' after retLGR;
	inyecBDL <= '0' after retLGR;
	
end comportamiento;
