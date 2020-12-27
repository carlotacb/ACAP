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
use work.retardos_pkg.all;

entity cam_MEM_DATOS is
port(reloj: in std_logic;
	ent_MD: in tam_dat_camino_MD; 
	direc_MD: in tam_dat_camino_MD; 
	opMD: in st_opMD;
	sal_MD: out tam_dat_camino_MD;
	MD_FR: out std_logic;
	MD_NA: out std_logic);
end cam_MEM_DATOS;

architecture estruc of cam_MEM_DATOS is
signal dirbyte: dir_bytes_contenedor;
signal alinE: tam_dat_camino_MD;
signal selec_byte: selec_bytes_contenedor;
signal datoL : tam_dat_camino_MD;
signal direc: integer range 0 to num_contenedores_Elogico_D-1;
begin

dirbyte <= direc_MD(lognum_bytes_contenedor-1 downto 0);
form_esc: FMTE port map(ent => ent_MD, dirbyte => dirbyte, opMD => opMD, alinE => alinE, selec_byte => selec_byte);

direc <= to_integer(unsigned(direc_MD(log_num_contenedores_Elogico_D-1+ lognum_bytes_contenedor downto lognum_bytes_contenedor))) after retdecoMD;
mem_dat: MD port map(reloj => reloj, PEM => opMD(3), direc => direc, selbyte => selec_byte, datoE => alinE, datoL => datoL);

form_lec: FMTL port map(ent => datoL, dirbyte => dirbyte, opMD => opMD, sal => sal_MD);

compro_acc: acceso_MD port map(direccion => direc_MD, opMD => opMD, MD_FR => MD_FR, MD_NA => MD_NA);

end; 


