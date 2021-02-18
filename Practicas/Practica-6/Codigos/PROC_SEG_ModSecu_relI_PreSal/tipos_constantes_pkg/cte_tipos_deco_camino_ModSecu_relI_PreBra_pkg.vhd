--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg is

-- subtipos y constantes utilizadas para el control del camino de datos
-- y operacion en el mismo de una instruccion

subtype st_SCond is std_logic;				-- senyal de secuenciamiento condicional

constant SCond_NO: st_SCond:= '0';
constant SCond_SI: st_SCond:= '1';

end package cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg;

