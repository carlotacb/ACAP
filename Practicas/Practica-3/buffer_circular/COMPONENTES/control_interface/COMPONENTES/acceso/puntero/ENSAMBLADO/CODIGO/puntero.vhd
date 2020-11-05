--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.componentes_puntero_pkg.all;
--! @image html puntero.png 

entity puntero is
   port (reloj: in std_logic;
	pcero, condicion: in std_logic;
	puntincr: out st_puntero;
	punt: out st_puntero);
end puntero;

architecture estruc of puntero is

signal punt1, puntincr1, salmux: st_puntero;

begin 

contadorbinario: cntbin port map(ent => punt1, sal => puntincr1);

puntincr <= puntincr1;

prxvalorentpunt: prxval port map(e0 => punt1, e1 => puntincr1, pcero => pcero, sel => condicion, sal => salmux);

estadopuntero: reg port map(reloj => reloj, D => salmux, Q => punt1);

punt <= punt1;
				
end;
