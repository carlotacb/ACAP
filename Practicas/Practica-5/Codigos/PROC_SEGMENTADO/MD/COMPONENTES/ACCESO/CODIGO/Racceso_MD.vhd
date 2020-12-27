--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

use work.retardos_even_pkg.all;
use work.componentes_MD_pkg.all;
use work.RegDes_pkg.all;
--! @image html RMDacceso.png

entity Racceso_MD is
	port (reloj, pcero, I: in std_logic;
		direccion: in tipo_direc_inst;	-- deteccion de direccion fuera de rango o no alineada
		opMD: in st_opMD;
		MD_FR: out std_logic;			-- 16 bits mas significativos deben ser como maximo x"0000"
		MD_NA: out std_logic);			-- direccion no alineada
end Racceso_MD;

architecture estructural of Racceso_MD is
signal opMD_RA4: st_opMD;

begin
RA4_opMD: RDI_N generic map(tam => num_opMD)
			port map (reloj => reloj, pcero => pcero, I => I, e => opMD, s => opMD_RA4);

R_acceso: acceso_MD port map(direccion => direccion, opMD => opMD_RA4, MD_FR => MD_FR, MD_NA => MD_NA);

end;

