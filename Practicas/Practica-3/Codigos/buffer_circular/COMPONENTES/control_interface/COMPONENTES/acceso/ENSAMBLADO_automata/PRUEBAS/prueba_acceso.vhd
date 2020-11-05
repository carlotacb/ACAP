--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;
use work.procedimientos_prueba_acceso_pkg.all;

entity prueba_acceso is 
end prueba_acceso;

architecture prueba of prueba_acceso is

component acceso is
   port (reloj: in std_logic;
	pcero: in std_logic;
	escritura: in std_logic;
	lectura: in std_logic;
	PE: out std_logic;
	cabeza: out st_puntero;
	cola: out st_puntero);
end component;

signal reloj: std_logic;
signal pcero, escritura, lectura: std_logic;
signal cabeza:  st_puntero;
signal cola, colaincr:  st_puntero;
signal PE: std_logic;

signal contador: integer:= 0;

shared variable final : boolean := false;

begin

accesoBR: acceso port map(reloj => reloj, pcero => pcero, escritura => escritura, lectura => lectura, PE => PE, cabeza => cabeza, cola => cola); 

estimulos: process 
begin
	pcero <= '1';
	escritura <= '0';
	lectura <= '0';

	wait_until_falling_edges(reloj,2);
	pcero <= '0';

	escribir (escritura, lectura, reloj);
	escribir (escritura, lectura, reloj);
	desactivar (escritura, lectura, reloj);
	leer (escritura,lectura, reloj);
	desactivar (escritura, lectura, reloj);
	concesclec (escritura, lectura, reloj);
	concesclec (escritura, lectura, reloj);

	wait_until_falling_edges(reloj,1); 
	
	report "Comprobacion finalizada.";
	final := true;
    wait;
end process;


process
begin
  if final = false then
    reloj <= '0';
    wait for 10 ns;
    contador <= contador + 1;
    reloj <= '1';
    wait for 10 ns;
	else
	  wait;
	end if;
end process;

end;
