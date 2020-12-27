--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.retardos_cntl_seg_pkg.all;
use work.RegDes_pkg.all;

entity senya_cntlRS is
	port(reloj, pcero, I : in std_logic;
		opsec: in st_opSEC;
		opsecA : out st_opSEC);
end senya_cntlRS;
--! @image html senyalRSLIB.png

architecture estructural of senya_cntlRS is
begin 

RDA4_opsec: RDI_N generic map (tam => num_opSEC)
			port map (reloj => reloj, pcero => pcero, I => I, e => opsec, s => opsecA);

end estructural;
