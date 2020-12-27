--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;
--! @image html ensam_RS.png

entity ensam_RS is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		RS : out std_logic);
end ensam_RS;


architecture estructural of ensam_RS is
signal opsecA: st_opSEC;
begin

	senyales_cntl: senya_cntlRS port map(reloj => reloj, pcero => pcero, I => I, opsec => opsec, opsecA => opsecA);

	R_sec: LDRS port map (opsecDL => opsec, opsecA => opsecA, RS => RS);

end estructural;
