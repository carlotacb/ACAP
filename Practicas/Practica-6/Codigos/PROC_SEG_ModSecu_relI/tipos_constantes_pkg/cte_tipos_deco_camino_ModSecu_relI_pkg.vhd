--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_deco_camino_ModSecu_relI_pkg is

-- subtipos y constantes utilizadas para el control del camino de datos
-- y operacion en el mismo de una instruccion

subtype st_mrelI is std_logic;				-- multiplexor mrelI
subtype st_SInCond is std_logic;			-- senyal de secuenciamiento incondicional

constant mrelI_NO: st_mrelI:= '0';
constant mrelI_SI: st_mrelI:= '1';

constant SInCond_NO: st_mrelI:= '0';
constant SInCond_SI: st_mrelI:= '1';

end package cte_tipos_deco_camino_ModSecu_relI_pkg;

