--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.componentes_control_interface_pkg.all;
--! @image html controlinterface.png 

entity controlinterface is
   port (reloj: in std_logic;
	pcero: in std_logic;
	validoP: in std_logic;
	listoC: in std_logic;
	validoB: out std_logic;
	listoB: out std_logic;
	cabeza: out st_puntero;
	cola: out st_puntero;
	PE: out std_logic);
end controlinterface;

architecture estruc of controlinterface is

signal escritura, lectura: std_logic;
signal vacio, lleno: std_logic;
signal colaincr: st_puntero;
signal listoB1: std_logic;

signal cabeza1, cola1: st_puntero;

begin

accesoBR: acceso port map(reloj => reloj, pcero => pcero, escritura => escritura, lectura => lectura, PE => PE, cabeza => cabeza1, cola => cola1, colaincr => colaincr); 

condi_control: control port map (cabeza => cabeza1, cola => cola1, colaincr => colaincr, vacio => vacio, lleno => lleno);

interfaceC: interface port map (lis_val => listoC, estado => vacio, val_lis => validoB, accion => lectura);

interfaceP: interface port map (lis_val => validoP, estado => lleno, val_lis => listoB1, accion => escritura);

	cabeza <= cabeza1;
	cola <= cola1;
	listoB <= listoB1;

end;






