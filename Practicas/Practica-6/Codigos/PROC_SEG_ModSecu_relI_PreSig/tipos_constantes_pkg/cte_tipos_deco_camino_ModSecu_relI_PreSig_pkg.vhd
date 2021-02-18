--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;

package cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg is

-- subtipos y constantes utilizadas para el control del camino de datos
-- y operacion en el mismo de una instruccion

subtype st_Pred is std_logic;				-- senyal de prediccion de secuenciamiento

constant Pred_SE: st_Pred:= '0';
constant Pred_SA: st_Pred:= '1';

end package cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg;

