--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRS_ModSecu_relI_PreSecu is
	port(opsecDL, opsecA : in st_opSEC;
		SInCond: in st_SInCond;
		SCond, SCondA: in std_logic;
		RS: out std_logic);
end LDRS_ModSecu_relI_PreSecu;


architecture comportamiento of LDRS_ModSecu_relI_PreSecu is

begin

	RS <= SInCond or (opsecDL(3) and not SCond) or (opsecA(3) and not SCondA) after retLDRS;
	
end comportamiento;
