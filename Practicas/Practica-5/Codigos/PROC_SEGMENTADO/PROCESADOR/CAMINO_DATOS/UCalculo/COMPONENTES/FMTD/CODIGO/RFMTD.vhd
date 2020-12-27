--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.RegDes_pkg.all;
--! @image html RFMTD.png

entity RFMTD is
	port(reloj, pcero, B: in std_logic;
		instr : in  tipo_inst_busq;
		inmD: in st_fmtD; 
		inmediato   : out tam_dat_camino);
end RFMTD;

architecture estructural of RFMTD is
signal instr_RDL3: tam_dat_camino;

begin

RDL3_FMTD: RDB_N generic map (tam => tam_instruc)
			port map (reloj => reloj, pcero => pcero, B => B, e => instr, s => instr_RDL3);

R_FMTD: FMTD port map (instr => instr_RDL3, inmD => inmD, inmediato => inmediato);

end;


