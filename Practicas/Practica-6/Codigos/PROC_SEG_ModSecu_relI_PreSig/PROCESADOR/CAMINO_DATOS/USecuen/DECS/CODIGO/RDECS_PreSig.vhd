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
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

use work.componentes_secuenciamiento_PreSig_pkg.all;
use work.RegDes_pkg.all;

entity RDECS_PreSig is
	port(reloj, pcero, I: in std_logic;
		opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		Pred: in st_Pred;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end RDECS_PreSig;

architecture estructural of RDECS_PreSig is
signal opSEC_RA4: st_opSEC;
signal Pred_RA4: st_Pred;

begin

RA4_opSEC: RDI_N generic map (tam => num_opSEC)
			port map (reloj => reloj, pcero => pcero, I => I, e => opSEC, s => opSEC_RA4);
RA4_Pred: RDI_1 port map (reloj => reloj, pcero => pcero, I => I, e => Pred, s => Pred_RA4);

R_DECS: DECS_PreSig port map (opSEC => opSEC_RA4, ig => ig, me => me, meu => meu, Pred => Pred_RA4, ErPre => ErPre, mSIC => mSIC);

end;
