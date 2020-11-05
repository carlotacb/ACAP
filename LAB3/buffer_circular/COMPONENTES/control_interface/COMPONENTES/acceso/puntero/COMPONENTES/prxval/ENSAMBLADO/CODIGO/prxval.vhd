--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;
use work.componentes_prxval_pkg.all;
--! @image html prxval.png 

entity prxval is
   port (e0, e1: in st_puntero;
	pcero, sel: in std_logic;
	sal: out st_puntero);
end prxval;

architecture estruc of prxval is

constant cero: st_puntero := (others => '0');
signal sal1: st_puntero;

begin

muxent: mux port map(e0 => e0, e1 => e1, sel => sel, sal => sal1);

muxpcero: mux port map(e0 => sal1, e1 => cero, sel => pcero, sal => sal);

end;

