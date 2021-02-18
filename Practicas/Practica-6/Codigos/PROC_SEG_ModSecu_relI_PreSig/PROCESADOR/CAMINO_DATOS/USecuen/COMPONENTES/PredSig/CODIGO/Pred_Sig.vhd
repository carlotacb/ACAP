--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

entity Pred_Sig is
	port(mxrelI: in st_mrelI;
		SCond: in st_SCond;
		Pred: in st_Pred;
		s_Predsal: out std_logic);
end Pred_Sig;

architecture comporta of Pred_Sig is
-- modifique el codigo

begin
	s_Predsal <= mxrelI;
end;
