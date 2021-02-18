--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_PreSecu_pkg.all;
use work.RegDes_pkg.all;

entity RErsec is
	port(reloj, pcero, I: in std_logic;
		opSEC:	in  st_opSEC;
		ErPre: in std_logic;
		msecuseg: out std_logic);
end RErsec;

architecture comporta of RErsec is
signal opSEC_A4: st_opSEC;

begin
RA4_opSEC: RDI_N generic map (tam => num_opSEC)
			port map (reloj => reloj, pcero => pcero, I => I, e => opSEC, s => opSEC_A4);

R_Ersec:	Ersec port map (opSEC => opSEC_A4, ErPre => ErPre, msecuseg => msecuseg);
end;
