--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cte_tipos_buffer_pkg is

constant tam_camino: natural:= 8;
subtype st_datos is std_logic_vector(tam_camino-1 downto 0);


constant tam_puntero: natural:= 3;
subtype st_puntero is std_logic_vector(tam_puntero-1 downto 0);

constant log_num_reg: natural:= 5;
constant num_reg: natural:= 2**log_num_reg;
subtype st_iden is std_logic_vector(log_num_reg-1 downto 0);

constant tam_secuencia: natural:= 5;

end package cte_tipos_buffer_pkg;


