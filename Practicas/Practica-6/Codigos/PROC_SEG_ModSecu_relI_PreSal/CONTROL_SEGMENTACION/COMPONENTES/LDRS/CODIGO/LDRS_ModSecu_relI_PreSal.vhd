--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRS_ModSecu_relI_PreSal is
	port(opsecDL, opsecA : in st_opSEC;
		SInCond: in st_SInCond;
		SCond, SCondA: in std_logic;
		RS: out std_logic);
end LDRS_ModSecu_relI_PreSal;


architecture comportamiento of LDRS_ModSecu_relI_PreSal is
-- modifique el codigo
begin

	RS <= opsecDL(3) or opsecA(3) or SInCond after retLDRS;
	
end comportamiento;
