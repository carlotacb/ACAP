--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDD is
	port(IDL1, IDL2 : in dir_reg; 
		valIDL1, valIDL2 : in std_logic;
		rdA, rdM, rdF, rdE : in dir_reg; 
		PBRA, PBRM, PBRF, PBRE : in st_PBR;
		IDL1A, IDL1M, IDL1F, IDL1E: out std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: out std_logic);
end LDD;


architecture estructural of LDD is

begin

	IDL1A <= '0' after retLDD;
	IDL1M <= '0' after retLDD;
	IDL1F <= '0' after retLDD;
	IDL1E <= '0' after retLDD;
	IDL2A <= '0' after retLDD;
	IDL2M <= '0' after retLDD;
	IDL2F <= '0' after retLDD;
	IDL2E <= '0' after retLDD;
	
end estructural;
