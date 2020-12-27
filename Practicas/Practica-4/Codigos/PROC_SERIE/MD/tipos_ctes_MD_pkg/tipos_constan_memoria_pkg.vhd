--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;

package tipos_constan_memoria_pkg is

constant tam_dat_MD: natural := tam_dat;

constant num_bytes_contenedor: integer:= 4;
constant num_contenedores_Elogico_D: integer:= tam_ELogico_datos/num_bytes_contenedor;
constant log_num_contenedores_Elogico_D: integer:= integer(ceil(log2(real(num_contenedores_Elogico_D))));

constant lognum_bytes_contenedor: integer:= integer(ceil(log2(real(num_bytes_contenedor))));

subtype tam_dat_camino_MD is std_logic_vector(tam_dat_MD-1 downto 0);
subtype selec_bytes_contenedor is std_logic_vector(num_bytes_contenedor-1 downto 0);
subtype dir_bytes_contenedor is std_logic_vector(lognum_bytes_contenedor-1 downto 0);

type contenedor_D is array(0 to num_bytes_contenedor-1) of byte;
type t_ramD is array ( 0 to num_contenedores_Elogico_D-1) of contenedor_D;

end package tipos_constan_memoria_pkg;
