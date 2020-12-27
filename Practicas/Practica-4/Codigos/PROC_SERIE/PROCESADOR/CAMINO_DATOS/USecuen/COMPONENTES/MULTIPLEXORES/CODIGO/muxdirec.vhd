--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.retardos_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

entity muxdirec is
generic (sel1: st_mSIC := mSIC_IMPL; sel2: st_mSIC := mSIC_MOD);
   port (d0, d1: in tipo_direc_inst;
	SEL: in st_mSIC;
	s: out tipo_direc_inst);
end muxdirec;

architecture comportamiento of muxdirec is
begin
	with SEL select
		s <= d0 after retMUX2 when sel1,
			d1 after retMUX2 when sel2,
			(others => '-') when others; 
end comportamiento;
