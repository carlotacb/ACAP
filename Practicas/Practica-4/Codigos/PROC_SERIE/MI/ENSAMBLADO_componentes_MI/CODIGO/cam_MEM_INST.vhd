--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;
use work.retardos_pkg.all;
use work.componentes_MI_pkg.all;
--! @image html cam_MEM_INST.png

entity cam_MEM_INST is
port(direc_MI: in tam_dat_camino_MI; 
	sal_MI: out tam_dat_camino_MI);
end cam_MEM_INST;

architecture estruc of cam_MEM_INST is
signal direc: integer range 0 to num_contenedores_Elogico_I-1;
begin

direc <= to_integer(unsigned(direc_MI(log_num_contenedores_Elogico_I-1+ lognum_bytes_contenedor_I downto lognum_bytes_contenedor_I))) after retdecoMI;
mem_inst: MI port map(direc => direc, datoL => sal_MI);

end; 


