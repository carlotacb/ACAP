--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.retardos_pkg.all;
use work.componentes_MD_pkg.all;

entity FMTE is
port(ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	alinE: out tam_dat_camino_MD;
	selec_byte: out selec_bytes_contenedor);
end FMTE;

architecture estructural of FMTE is

signal t_alinE: tam_dat_camino_MD;
signal t_selec_byte: selec_bytes_contenedor;

begin

alinaE: alinearE port map(ent => ent, dirbyte => dirbyte, sal => t_alinE);

selecE_byte: sel_byte port map(dirbyte => dirbyte, opMD => opMD, selec_byte => t_selec_byte);

alinE <= t_alinE after retFMTE;
selec_byte <= t_selec_byte after retFMTE;

end; 


