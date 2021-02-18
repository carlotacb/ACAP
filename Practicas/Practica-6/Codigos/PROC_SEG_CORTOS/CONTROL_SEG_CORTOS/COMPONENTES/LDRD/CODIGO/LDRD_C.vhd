--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_cntl_seg_C_pkg.all;
use work.componentes_control_seg_pkg.all;

entity LDRD_C is
	port(IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		latphA: in std_logic;
		latphM: in std_logic;
		RD : out std_logic);
end LDRD_C;



architecture comportamiento of LDRD_C is

signal s_andnot_IDL1A_IDL1M: std_logic;
signal s_andnot_IDL2A_IDL2M: std_logic;
signal s_or_IDL1A_IDL2A: std_logic;
signal s_or_andnot_andnot: std_logic;
signal s_and_laptphA: std_logic;
signal s_and_laptphM: std_logic;
signal s_or: std_logic;

begin
	andnot_IDL1A_IDL1M: andv1n port map(a => IDL1A, b => IDL1M, s => s_andnot_IDL1A_IDL1M);
	andnot_IDL2A_IDL2M: andv1n port map(a => IDL2A, b => IDL2M, s => s_andnot_IDL2A_IDL2M);
	or_IDL1A_IDL2A: orv2 port map(a => IDL2A, b => IDL1A, s => s_or_IDL1A_IDL2A);
	or_andnot_andnot: orv2 port map(a => s_andnot_IDL1A_IDL1M, b => s_andnot_IDL2A_IDL2M, s => s_or_andnot_andnot);
	and_laptphA: andv2 port map(a => latphA, b => s_or_IDL1A_IDL2A, s => s_and_laptphA);
	and_laptphM: andv2 port map(a => s_or_andnot_andnot, b => latphM, s => s_and_laptphM);
	final_or: orv2 port map(a => s_and_laptphA, b => s_and_laptphM, s => s_or);

	RD <= s_or after retLDRD_C;
	
end comportamiento;
