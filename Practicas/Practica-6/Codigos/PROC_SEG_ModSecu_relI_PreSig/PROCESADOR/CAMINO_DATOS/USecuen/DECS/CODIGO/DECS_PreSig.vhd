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

use work.retardos_pkg.all;

entity DECS_PreSig is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		Pred: in st_Pred;
		ErPre: out std_logic;
		mSIC: out st_mSIC);
end DECS_PreSig;

architecture comporta of DECS_PreSig is

constant cumple: std_logic:= '1';
constant no_cumple: std_logic:= '0';
constant Pre_correcta: std_logic:= '0';
constant Pre_erronea: std_logic:= '1';

begin

secuen: process(opSEC, ig, me, meu)
variable v_mSIC: st_mSIC;
variable v_ErPre, v_condicion: std_logic;
begin
	v_mSIC := mSIC_IMPL;
	v_condicion := no_cumple;
	case opSEC is
		when DECS_BEQ => 
			if ig = igSI then
				v_mSIC := mSIC_MOD;
				v_condicion := cumple;
			end if;
		when DECS_BNE => 
			if ig = igNO then
				v_mSIC := mSIC_MOD;
				v_condicion := cumple;
			end if;
		when DECS_BLT => 
			if me = meSI then
				v_mSIC := mSIC_MOD;
				v_condicion := cumple;
			end if;
		when DECS_BGE => 
			if me = meNO or ig = igSI then
				v_mSIC := mSIC_MOD;
				v_condicion := cumple;
			end if;
		when DECS_BLTU => 
			if meu = meuSI then
				v_mSIC := mSIC_MOD;
				v_condicion := cumple;
			end if;
		when DECS_BGEU => 
			if meu = meuNO or ig = igSI then
				v_mSIC := mSIC_MOD;
				v_condicion := cumple;
			end if;
		when DECS_IMPLICITO => 
			v_mSIC := mSIC_IMPL;
		when DECS_INCONDICIONAL => 
			v_mSIC := mSIC_MOD;
		when others =>
			v_mSIC := mSIC_IMPL;
	end case;

	if Pred = Pred_SE then
		if v_condicion = cumple then 
			v_ErPre := Pre_erronea;
		else
			v_ErPre := Pre_correcta;
		end if;
	else
		if v_condicion = cumple then
			v_ErPre := Pre_correcta;
		else
			v_ErPre := Pre_erronea;
		end if;
	end if;

	mSIC <= v_mSIC after retDECS;
--	ErPre <= v_ErPre and opSEC(3) after retDECS;
	ErPre <= v_ErPre and opSEC(num_opSEC-1) after retDECS;
end process;

end;
