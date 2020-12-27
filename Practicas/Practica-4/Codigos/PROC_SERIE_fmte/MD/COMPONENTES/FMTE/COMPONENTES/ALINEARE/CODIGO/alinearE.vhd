--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.componentes_FMTE_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.retardos_pkg.all;

entity alinearE is
port(ent: in tam_dat_camino_MD;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end alinearE;

architecture estructural of alinearE is

subtype t_byte is std_logic_vector(tam_byte-1 downto 0);

-- senyales

begin
-- instanciacion 

	sal <= (others => '0') after retFMTE;

end; 


