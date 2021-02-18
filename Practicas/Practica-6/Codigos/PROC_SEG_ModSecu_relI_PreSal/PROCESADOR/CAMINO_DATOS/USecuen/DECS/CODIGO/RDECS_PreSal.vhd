--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.riscv32_coop_funct_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_PreSal_pkg.all;
use work.RegDes_pkg.all;

entity RDECS_PreSal is
	port(reloj, pcero, I: in std_logic;
		opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end RDECS_PreSal;

architecture estructural of RDECS_PreSal is
signal opSEC_RA4: st_opSEC;

begin

RA4_opSEC: RDI_N generic map (tam => num_opSEC)
			port map (reloj => reloj, pcero => pcero, I => I, e => opSEC, s => opSEC_RA4);

R_DECS: DECS_PreSal port map (opSEC => opSEC_RA4, ig => ig, me => me, meu => meu, ErPre => ErPre, mSIC => mSIC);

end;
