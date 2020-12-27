
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.componentes_MD_pkg.all;
use work.RegDes_pkg.all;
--! @image html RFMTL.png

entity RFMTL is
port(reloj, pcero, I: in std_logic;
	ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end RFMTL;

architecture estructural of RFMTL is

signal ent_R6: tam_dat_camino_MD;
signal opMD_RA4, opMD_RM5, opMD_R6: st_opMD;
signal dirbyte_RM5, dirbyte_R6: dir_bytes_contenedor;

begin

R6_ent: RD_N generic map(tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => ent, s => ent_R6);

RA4_opMD: RDI_N generic map(tam => num_opMD)
			port map (reloj => reloj, pcero => pcero, I => I, e => opMD, s => opMD_RA4);
RM5_opMD: RD_N generic map(tam => num_opMD)
			port map (reloj => reloj, pcero => pcero, e => opMD_RA4, s => opMD_RM5);
R6_opMD: RD_N generic map(tam => num_opMD)
			port map (reloj => reloj, pcero => pcero, e => opMD_RM5, s => opMD_R6);

RM5_dirbyte: RD_N generic map(tam => lognum_bytes_contenedor)
			port map (reloj => reloj, pcero => pcero, e => dirbyte, s => dirbyte_RM5);
R6_dirbyte: RD_N generic map(tam => lognum_bytes_contenedor)
			port map (reloj => reloj, pcero => pcero, e => dirbyte_RM5, s => dirbyte_R6);

R_FMTL: FMTL port map(ent => ent_R6, dirbyte => dirbyte_R6, opMD => opMD_R6, sal => sal);

end; 


