--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.componentes_MD_pkg.all;
use work.RegDes_pkg.all;

entity RFMTE_C is
port(reloj, pcero, I: in std_logic;
	ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	alinE: out tam_dat_camino_MD;
	selec_byte: out selec_bytes_contenedor);
end RFMTE_C;

architecture estructura of RFMTE_C is

signal ent_RA4: tam_dat_camino_MD;
signal opMD_RA4: st_opMD;

begin

RA4_opMD: RDI_N generic map(tam => num_opMD)
			port map (reloj => reloj, pcero => pcero, I => I, e => opMD, s => opMD_RA4);

R_FMTE: FMTE port map(ent => ent, dirbyte => dirbyte, opMD => opMD_RA4, alinE => alinE, selec_byte => selec_byte);

end; 


