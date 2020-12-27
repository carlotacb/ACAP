--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_pkg.all;
use work.RegDes_pkg.all;
--! @image html RFMTS.png

entity RFMTS is
	port(reloj, pcero, B: in std_logic;
		instr:	in  tipo_inst_busq;
		inmS:	in st_fmtS;
		inmediato: out tam_dat_camino);
end RFMTS;

architecture estructural of RFMTS is
signal instr_RDL3: tipo_inst_busq;

begin

RDL3_FMTS: RDB_N generic map (tam => tam_instruc)
			port map (reloj => reloj, pcero => pcero, B => B, e => instr, s => instr_RDL3);


R_FMTS: FMTS port map (instr => instr_RDL3, inmS => inmS, inmediato => inmediato);

end;


