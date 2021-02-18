--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

entity Ersec is
	port(opSEC:	in  st_opSEC;
		ErPre: in std_logic;
		msecuseg: out std_logic);
end Ersec;

architecture comporta of Ersec is
signal op_SEC: std_logic;
-- modifique el codigo

begin
	op_SEC <= opSEC(3) and (not opSEC(2)) and (opSEC(1) or opSEC(0));
	msecuseg <= op_SEC or ErPre;
end;
