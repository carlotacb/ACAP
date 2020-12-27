--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;

package componentes_MD_pkg is

component MD is
port (reloj, PEM : in std_logic;
	direc : in integer range 0 to num_contenedores_Elogico_D-1;   
	selbyte : in std_logic_vector (num_bytes_contenedor-1 downto 0); 
	datoE : in tam_dat_camino_MD; 
	datoL : out tam_dat_camino_MD ); 
end component;

component FMTL is
port(ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end component;

component alinear is
port(ent: in tam_dat_camino_MD;
	dirbyte: in dir_bytes_contenedor;
	sal: out tam_dat_camino_MD);
end component;

component FMTL_extsig is
port(signo: in std_logic;
	d0: in tam_dat_camino_MD;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end component;

component FMTL_sel_signo is 
port (d: in	selec_bytes_contenedor;
	sel: in	dir_bytes_contenedor;
	opMD: in st_opMD;
	s: out	std_logic);
end component;	

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

component acceso_MD is
	port (direccion: in tipo_direc_inst;	-- deteccion de direccion fuera de rango o no alineada
		opMD: in st_opMD;
		MD_FR: out std_logic;			-- direccion fuera de rango
		MD_NA: out std_logic);			-- direccion no alineada
end component;

end package componentes_MD_pkg;

