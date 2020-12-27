--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.retardos_pkg.all;

entity eval is
	port(L1, L2:	in  tam_dat_camino;
		ig, me, meu:	out std_logic );
end eval;

architecture comport of eval is
begin
	ig <= igSI after reteval when (L1 = L2) else igNO after reteval;
	me <= meSI after reteval when (signed(L1) < signed(L2)) else meNO after reteval;
	meu <= meuSI after reteval when (unsigned(L1) < unsigned(L2)) else meuNO after reteval;

end;
