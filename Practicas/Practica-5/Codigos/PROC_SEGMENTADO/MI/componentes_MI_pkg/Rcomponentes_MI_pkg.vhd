--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;

package Rcomponentes_MI_pkg is

component Rcam_MEM_INST is 
port(reloj: in std_logic;
	direc_MI: in tam_dat_camino_MI; 
	sal_MI: out tam_dat_camino_MI);
end component;

component Rcam_MEM_INST_INY_Pcero is
    port (reloj, Pcero: in std_logic;
			CP, proxCP: in tipo_direc_inst;
			bloqCP, inyecBDL: in std_logic;
			instr:	out tipo_inst_busq);
end component;

component muxIns is
  port (d0, d1: in tipo_inst_busq;
	SEL: in std_logic;
	s: out tipo_inst_busq);
end component;

component RMI is
port (reloj : in std_logic; direc : in integer range 0 to num_contenedores_Elogico_I-1;  -- numero de bits de la direccion 
	datoL : out tam_dat_camino_MI ); 
end component;

end package Rcomponentes_MI_pkg;

