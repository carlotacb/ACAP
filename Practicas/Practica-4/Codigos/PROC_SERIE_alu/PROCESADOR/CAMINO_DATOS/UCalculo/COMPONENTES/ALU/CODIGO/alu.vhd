--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.retardos_pkg.all;
use work.componentes_ALU_pkg.all;

entity alu is
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end alu;

architecture estruct of alu is

signal s_despla, s_logica, s_sumalg, s_slt: tam_dat_camino;
signal s_des_log, s_slt_sum: tam_dat_camino;
signal t_s: tam_dat_camino;
signal men: std_logic;
signal mx_01, mx_23, mx: std_logic;

begin
-- instanciacion unidades funcionales
despla_M: despla port map (opALU => opALU, a => a, b => b, s => s_despla);
logica_M: logica port map (opALU => opALU, a => a, b => b, s => s_logica);
sumalg_M: sumalg port map (opALU => opALU, a => a, b => b, men => men, s => s_sumalg);
slt_M:	slt port map (men => men, s => s_slt);
	
-- modifique las senyales de seleccion
	mx_01 <= '0';
	mx_23 <= '0';
	mx <= '0';
	
-- instanciacion arbol de multiplexores
--mux_des_log: mx2 
--mux_slt_sum: mx2 
--mux_final:   mx2 

-- salida
	s <= (others => '0') after retALU;
	
end;
