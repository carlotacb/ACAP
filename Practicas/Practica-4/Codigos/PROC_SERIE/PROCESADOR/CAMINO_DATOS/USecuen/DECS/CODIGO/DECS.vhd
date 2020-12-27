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

entity DECS is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		mSIC: out st_mSIC);
end DECS;

architecture comporta of DECS is
begin

secuen: process(opSEC, ig, me, meu)
variable v_mSIC: st_mSIC;

begin
	v_mSIC := mSIC_IMPL;
	case opSEC is
		when DECS_BEQ => 
			if ig = igSI then
				v_mSIC := mSIC_MOD;
			end if;
		when DECS_BNE => 
			if ig = igNO then
				v_mSIC := mSIC_MOD;
			end if;
		when DECS_BLT => 
			if me = meSI then
				v_mSIC := mSIC_MOD;
			end if;
		when DECS_BGE => 
			if me = meNO or ig = igSI then
				v_mSIC := mSIC_MOD;
			end if;
		when DECS_BLTU => 
			if meu = meuSI then
				v_mSIC := mSIC_MOD;
			end if;
		when DECS_BGEU => 
			if meu = meuNO or ig = igSI then
				v_mSIC := mSIC_MOD;
			end if;
		when DECS_IMPLICITO => 
			v_mSIC := mSIC_IMPL;
		when DECS_INCONDICIONAL => 
			v_mSIC := mSIC_MOD;
		when others =>
			v_mSIC := mSIC_IMPL;
	end case;
	mSIC <= v_mSIC after retDECS;
end process;

end;
