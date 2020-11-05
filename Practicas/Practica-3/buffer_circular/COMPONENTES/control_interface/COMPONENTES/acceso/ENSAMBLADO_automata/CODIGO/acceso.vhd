--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.componentes_acceso_pkg.all;

entity acceso is
   port (reloj: in std_logic;
	pcero: in std_logic;
	escritura: in std_logic;
	lectura: in std_logic;
	PE: out std_logic;
	cabeza: out st_puntero;
	cola: out st_puntero);
end acceso;

architecture estruc of acceso is
-- senyales

begin
-- instantaciones punteros cola y cabeza

	cabeza <= (others => '0');
	cola <= (others => '0');

	PE <= escritura;
				
end;
