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
use work.retardos_pkg.all;

entity DECS_PreSecu is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end DECS_PreSecu;

architecture comporta of DECS_PreSecu is

constant aciertoPre: std_logic:= '0';
constant errorPre: std_logic:= '1';
begin

secuen: process(opSEC, ig, me, meu)
variable v_mSIC: st_mSIC;
variable v_ErPre: std_logic;
begin
	v_mSIC := mSIC_IMPL;
	v_ErPre := aciertoPre;
	case opSEC is
		when DECS_BEQ => 
			if ig = igSI then
				v_mSIC := mSIC_MOD;
				v_ErPre := errorPre;
			end if;
		when DECS_BNE => 
			if ig = igNO then
				v_mSIC := mSIC_MOD;
				v_ErPre := errorPre;
			end if;
		when DECS_BLT => 
			if me = meSI then
				v_mSIC := mSIC_MOD;
				v_ErPre := errorPre;
			end if;
		when DECS_BGE => 
			if me = meNO or ig = igSI then
				v_mSIC := mSIC_MOD;
				v_ErPre := errorPre;
			end if;
		when DECS_BLTU => 
			if meu = meuSI then
				v_mSIC := mSIC_MOD;
				v_ErPre := errorPre;
			end if;
		when DECS_BGEU => 
			if meu = meuNO or ig = igSI then
				v_mSIC := mSIC_MOD;
				v_ErPre := errorPre;
			end if;
		when DECS_IMPLICITO => 
			v_mSIC := mSIC_IMPL;
		when DECS_INCONDICIONAL => 
			v_mSIC := mSIC_MOD;
		when others =>
			v_mSIC := mSIC_IMPL;
	end case;
	mSIC <= v_mSIC after retDECS;
	ErPre <= v_ErPre after retDECS;
end process;

end;
