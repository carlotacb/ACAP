--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_buffer_pkg.all;

package componentes_acceso_pkg is

component puntero is
   port (reloj: in std_logic;
	pcero, condicion: in std_logic;
	puntincr: out st_puntero;
	punt: out st_puntero);
end component;

end package componentes_acceso_pkg;
