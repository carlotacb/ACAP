--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;

package tipos_constan_memoria_I_pkg is

constant tam_dat_MI: natural := tam_instruc; 

constant num_bytes_I: integer:= tam_dat_MI/tam_byte;

constant num_bytes_contenedor_I: integer:= 4;
constant num_contenedores_Elogico_I: integer:= tam_ELogico_datos_I/num_bytes_contenedor_I;
constant log_num_contenedores_Elogico_I: integer:= integer(ceil(log2(real(num_contenedores_Elogico_I))));

constant lognum_bytes_contenedor_I: integer:= integer(ceil(log2(real(num_bytes_contenedor_I))));

subtype tam_dat_camino_MI is std_logic_vector(tam_dat_MI-1 downto 0);
subtype selec_bytes_contenedor_I is std_logic_vector(num_bytes_contenedor_I-1 downto 0);
subtype dir_bytes_contenedor_I is std_logic_vector(lognum_bytes_contenedor_I-1 downto 0);

type contenedor_I is array(0 to num_bytes_contenedor_I-1) of byte;
type t_ramI is array ( 0 to num_contenedores_Elogico_I-1) of contenedor_I;

end package tipos_constan_memoria_I_pkg;

