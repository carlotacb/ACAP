--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRS is
	port(opsecDL, opsecA : in st_opSEC;
		RS: out std_logic);
end LDRS;


architecture comportamiento of LDRS is

signal salida_rs: std_logic;

component orv2 is 														
	port(a, b: in std_logic;
	s: out std_logic);
end component;

begin
-- el bit mas alto de opsecA indica que la operacion ES de salto
--	Sistema conservador riesgo tanto en DL como en ALU

	or_opsec_3: orv2 port map (a => opsecDL(3), b=> opsecA(3), s=> salida_rs);
   RS <= salida_rs after retLDRS;
	
--	RS <= '0' after retLDRS;
	
end comportamiento;
