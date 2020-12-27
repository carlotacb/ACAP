--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;

package componentes_MI_pkg is

component MI is
port (direc : in integer range 0 to num_contenedores_Elogico_I-1;  
	datoL : out tam_dat_camino_MI ); 
end component;

end package componentes_MI_pkg;

