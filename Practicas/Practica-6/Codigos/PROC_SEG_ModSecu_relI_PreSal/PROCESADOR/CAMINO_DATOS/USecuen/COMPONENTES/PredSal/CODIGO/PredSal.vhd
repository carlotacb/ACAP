--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;

entity PredSal is
	port(mxrelI: in st_mrelI;
		SCond: in st_SCond;
		s_Predsal: out std_logic);
end PredSal;

architecture comporta of PredSal is
-- modifique el codigo

begin
	s_Predsal <= mxrelI;
end;
