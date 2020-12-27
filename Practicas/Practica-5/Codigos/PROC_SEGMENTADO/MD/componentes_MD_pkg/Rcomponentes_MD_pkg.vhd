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
use work.tipos_constan_memoria_pkg.all;

package Rcomponentes_MD_pkg is

component RMD is
port (reloj: in std_logic;
	PEM : in std_logic;
	direc : in integer range 0 to num_contenedores_Elogico_D-1;   
	selbyte : in std_logic_vector (num_bytes_contenedor-1 downto 0); 
	datoE : in tam_dat_camino_MD; 
	datoL : out tam_dat_camino_MD ); 
end component;

component RFMTL is
port(reloj, pcero, I: in std_logic;
	ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end component;

component RFMTE is
port(reloj, pcero, I: in std_logic;
	ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	alinE: out tam_dat_camino_MD;
	selec_byte: out selec_bytes_contenedor);
end component;

component Racceso_MD is
	port (reloj, pcero, I: in std_logic;
		direccion: in tipo_direc_inst;	-- deteccion de direccion fuera de rango o no alineada
		opMD: in st_opMD;
		MD_FR: out std_logic;			-- direccion fuera de rango
		MD_NA: out std_logic);			-- direccion no alineada
end component;

end package Rcomponentes_MD_pkg;

