--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;
use work.componentes_buffer_circular_pkg.all;
--! @image html buffer_circular.png 
--! @image html buffer_circular_detalle.png 

entity buffer_circular is 
port (reloj, pcero: in std_logic;
	datoE: in st_datos;
	validoP, listoC: in std_logic;
	listoB, validoB: out std_logic;
	datoL: out st_datos);
end buffer_circular;

architecture estructural of buffer_circular is	
signal PE: std_logic;
signal cabeza, cola: st_puntero;

begin

bancoregistros: BR port map (reloj => reloj, ED => datoE, dirE => cola, dirL => cabeza, pe => PE, LD => datoL);

buffercontrol: controlinterface port map(reloj => reloj, pcero => pcero, validoP => validoP, listoC => listoC, validoB => validoB, listoB => listoB, cabeza => cabeza, cola => cola, PE => PE); 

end estructural;


