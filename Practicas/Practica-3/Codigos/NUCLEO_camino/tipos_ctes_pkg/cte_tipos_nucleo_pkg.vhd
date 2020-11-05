--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_nucleo_pkg is

constant tam_camino: natural:= 8;
subtype st_datos is std_logic_vector(tam_camino-1 downto 0);

constant log_num_reg: natural:= 5;
constant num_reg: natural:= 2**log_num_reg;
subtype st_iden is std_logic_vector(log_num_reg-1 downto 0);

-- banco de registros
type ramtype is array (0 to num_reg-1) of st_datos;

constant tam_secuencia: natural:= 5;

end package cte_tipos_nucleo_pkg;


