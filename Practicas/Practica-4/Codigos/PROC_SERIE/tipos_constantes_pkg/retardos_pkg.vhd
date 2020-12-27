--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package retardos_pkg is

constant retdecoBR: time := 2 ns;
constant retescBR: time := 5 ns;
constant retlecBR: time := 5 ns;

constant retALU: time := 4 ns;

constant retMUX3: time := 1 ns;
constant retMUX2: time := 1 ns;

constant reteval: time := 1 ns;
constant retDECS: time := 2 ns;

constant retSUMADOR: time := 2 ns;

constant retREGCP: time := 1 ns;

constant retDECO: time := 4 ns;

constant retfmtD: time := 1 ns;

constant retfmtS: time := 1 ns;

constant retdecoMD: time := 2 ns;
constant retescMD: time := 8 ns;
constant retlecMD: time := 8 ns;

constant retdecoMI: time := 2 ns;
constant retlecMI: time := 8 ns;

constant retFMTE: time := 2 ns;
constant retFMTL: time := 2 ns;

end package retardos_pkg;
