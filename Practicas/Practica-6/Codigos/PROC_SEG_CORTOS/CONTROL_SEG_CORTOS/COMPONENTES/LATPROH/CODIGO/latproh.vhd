--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.param_disenyo_pkg.all;
use work.RegDes_pkg.all;

entity latproh is 
  port (reloj, Pcero, I: std_logic;
		inst_latph: in std_logic;
		latphA: out std_logic;
		latphM: out std_logic);
end latproh;

architecture estruc of latproh is
signal s_regstry1: std_logic;

begin
	registry1: RDI_1 port map(reloj => reloj, pCero=> pCero, I=>I,e=>inst_latph,s=>s_regstry1);
	registry2: RD_1 port map(reloj => reloj, pCero=> pCero,e=>s_regstry1,s=>latphM);
	latphA <= s_regstry1;
	
end;