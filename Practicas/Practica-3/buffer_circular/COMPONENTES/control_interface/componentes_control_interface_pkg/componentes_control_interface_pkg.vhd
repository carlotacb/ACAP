--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;

package componentes_control_interface_pkg is

component control is
   port (cabeza: in st_puntero;
	cola, colaincr: in st_puntero;
	vacio: out std_logic;
	lleno: out std_logic);
end component;

component acceso is
   port (reloj: in std_logic;
	pcero: in std_logic;
	escritura: in std_logic;
	lectura: in std_logic;
	PE: out std_logic;
	cabeza: out st_puntero;
	cola: out st_puntero;
	colaincr: out st_puntero);
end component;

component interface is
   port (lis_val: in std_logic;
	estado: in std_logic;
	val_lis: out std_logic;
	accion: out std_logic );
end component;

end package componentes_control_interface_pkg;
