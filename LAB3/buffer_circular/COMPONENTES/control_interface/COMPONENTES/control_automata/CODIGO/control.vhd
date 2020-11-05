--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;
use work.componentes_control_automata_pkg.all;

entity control is
   port (reloj, pcero: in std_logic;
	cabeza: in st_puntero;
	cola: in st_puntero;
	escritura, lectura: in std_logic;
	vacio: out std_logic;
	lleno: out std_logic );
end control;

architecture estruc of control is

constant vaciando: std_logic:= '0';
constant llenando: std_logic:= '1';


signal prox_estado, estado: std_logic;

begin
-- instanciacion registro de estado

-- logica proximo estado
--	prox_estado <= '0' when pcero = '1' else

-- utilice sentencias de asignacion de senyal condicional para las comparaciones

	lleno <= '0' after retcontrol;
	vacio <= '0' after retcontrol;

end;
