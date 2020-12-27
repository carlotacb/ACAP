--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDRD is
	port(IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		RD : out std_logic);
end LDRD;


architecture comportamiento of LDRD is

signal or_1A_1M,or_1F_1E,or_2A_2M,or_2F_2E: std_logic;
signal or1, or2: std_logic;
signal s_rd: std_logic;

component orv2 is 														
	port(a, b: in std_logic;
	s: out std_logic);
end component;

begin

	or_1AM: orv2 port map (a => IDL1A, b=> IDL1M, s=> or_1A_1M);
	or_1FE: orv2 port map (a => IDL1F, b=> IDL1E, s=> or_1F_1E);
	or_2AM: orv2 port map (a => IDL2A, b=> IDL2M, s=> or_2A_2M);
	or_2FE: orv2 port map (a => IDL2F, b=> IDL2E, s=> or_2F_2E);
	
	or_1AMFE: orv2 port map (a => or_1A_1M, b=> or_1F_1E, s=> or1);
	or_2AMFE: orv2 port map (a => or_2A_2M, b=> or_2F_2E, s=> or2);
	
	or_1AMFE_2AMFE: orv2 port map (a => or1, b=> or2, s=> s_rd);

	RD <= s_rd after retLDRD;

--	RD <= '0' after retLDRD;
	
end comportamiento;
