--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;

package componentes_FMTE_pkg is

component mux2M is
generic (tam_mux_datos: natural:= tam_byte);
   port (d0, d1: in std_logic_vector(tam_mux_datos-1 downto 0);
	SEL: in std_logic;
	s: out std_logic_vector(tam_mux_datos-1 downto 0));
end component;

component alinearE is
port(ent: in tam_dat_camino_MD;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end component;

component sel_byte is
port(dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	selec_byte: out selec_bytes_contenedor);
end component;

component FMTE is
port(ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	alinE: out tam_dat_camino_MD;
	selec_byte: out selec_bytes_contenedor);
end component;

end package componentes_FMTE_pkg;

