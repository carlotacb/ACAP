--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.componentes_control_seg_pkg.all;


use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRS_ModSecu_relI is
	port(opsecDL, opsecA : in st_opSEC;
		SInCond: in st_SInCond;
		RS: out std_logic);
end LDRS_ModSecu_relI;


architecture comportamiento of LDRS_ModSecu_relI is

signal s_or_opsec_A: std_logic;
signal s_or_SinCon: std_logic;

begin

	or_opsec_opsecA: orv2 port map (a => opsecDL(3), b => opsecA(3), s => s_or_opsec_A);
	or_SinCon: orv2 port map (a => s_or_opsec_A, b => SinCond, s => s_or_SinCon);

	RS <= s_or_SinCon after retLDRS;
	
end comportamiento;
