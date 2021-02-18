--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.retardos_cntl_seg_pkg.all;
use work.componentes_control_seg_pkg.all;

entity LGR_PreSecu is
	port(RID: in std_logic;
		RS: in std_logic;
		ErPre: in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LGR_PreSecu;

architecture compor of LGR_PreSecu is

begin
	bloqCP <= ((not ErPre) and RID) after retLGR;
	bloqBDL <= ((not ErPre) and RID) after retLGR;
	inyecBDL <= (((not RID) and RS) or ErPre) after retLGR;
	inyecDLA <= ((not ErPre) and RID) after retLGR;
	
end;