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
use work.retardos_pkg.all;
use work.Rcomponentes_MD_pkg.all;
use work.Rcomponentes_MD_C_pkg.all;
use work.RegDes_pkg.all;

entity Rcam_MEM_DATOS_C is
port(reloj, pcero, I: in std_logic;
	ent_MD: in tam_dat_camino_MD; 
	direc_MD: in tam_dat_camino_MD; 
	opMD: in st_opMD;
	sal_MD: out tam_dat_camino_MD;
	MD_FR: out std_logic;
	MD_NA: out std_logic);
end Rcam_MEM_DATOS_C;

architecture estruc of Rcam_MEM_DATOS_C is
signal dirbyte: dir_bytes_contenedor;
signal alinE: tam_dat_camino_MD;
signal selec_byte: selec_bytes_contenedor;
signal datoL : tam_dat_camino_MD;
signal direc: integer range 0 to num_contenedores_Elogico_D-1;
signal opMD_RA4: st_opMD;
begin

dirbyte <= direc_MD(lognum_bytes_contenedor-1 downto 0);
Rform_esc: RFMTE_C port map(reloj => reloj, pcero => pcero, I => I, ent => ent_MD, dirbyte => dirbyte, opMD => opMD, alinE => alinE, selec_byte => selec_byte);

RA4_opMD: RDI_N generic map(tam => num_opMD)
			port map (reloj => reloj, pcero => pcero, I => I, e => opMD, s => opMD_RA4);
direc <= to_integer(unsigned(direc_MD(log_num_contenedores_Elogico_D-1+ lognum_bytes_contenedor downto lognum_bytes_contenedor))) after retdecoMD;
Rmem_dat: RMD port map(reloj => reloj, PEM => opMD_RA4(3), direc => direc, selbyte => selec_byte, datoE => alinE, datoL => datoL);

Rform_lec: RFMTL port map(reloj => reloj, pcero => pcero, I => I, ent => datoL, dirbyte => dirbyte, opMD => opMD, sal => sal_MD);

Rcompro_acc: Racceso_MD port map(reloj => reloj, pcero => pcero, I => I, direccion => direc_MD, opMD => opMD, MD_FR => MD_FR, MD_NA => MD_NA);

end; 


