--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;

package componentes_buffer_circular_pkg is

component BR is
	port (reloj	: in  std_logic;
		ED			: in  st_datos;
		dirE		: in  st_puntero;
		dirL		: in  st_puntero;
		pe			: in  std_logic;
		LD			: out st_datos);
end component;

component controlinterface is
   port (reloj: in std_logic;
	pcero: in std_logic;
	validoP: in std_logic;
	listoC: in std_logic;
	validoB: out std_logic;
	listoB: out std_logic;
	cabeza: out st_puntero;
	cola: out st_puntero;
	PE: out std_logic);
end component;

end package componentes_buffer_circular_pkg;


