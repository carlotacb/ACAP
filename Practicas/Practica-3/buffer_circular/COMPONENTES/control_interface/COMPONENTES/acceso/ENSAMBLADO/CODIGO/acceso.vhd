--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.componentes_acceso_pkg.all;
--! @image html acceso.png 

entity acceso is
   port (reloj: in std_logic;
	pcero: in std_logic;
	escritura: in std_logic;
	lectura: in std_logic;
	PE: out std_logic;
	cabeza: out st_puntero;
	cola: out st_puntero;
	colaincr: out st_puntero);
end acceso;

architecture estruc of acceso is
-- senyales
	signal puntincr_esc: st_puntero;
	signal escritura_temp: std_logic;
	signal lectura_temp: std_logic;

begin
-- instanciaciones punteros cola y cabeza
	puntero_cola: puntero port map (reloj=>reloj, pcero=>pcero, condicion=>escritura, puntincr=>colaincr, punt=>cola);
	puntero_cabeza: puntero port map (reloj=>reloj, pcero=>pcero, condicion=>lectura, puntincr=>puntincr_esc, punt=>cabeza);
	--cabeza <= (others => '0');
	--cola <= (others => '0');
	--colaincr <= (others => '0');

	PE <= escritura;
				
end;
