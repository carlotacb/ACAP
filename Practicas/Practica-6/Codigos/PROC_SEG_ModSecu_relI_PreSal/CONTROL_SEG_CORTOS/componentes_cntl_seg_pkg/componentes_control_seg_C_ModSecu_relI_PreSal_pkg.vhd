--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_control_seg_C_ModSecu_relI_PreSal_pkg is

component LIB_C_ModSecu_relI_PreSal is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		ErPre: in std_logic;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

end package componentes_control_seg_C_ModSecu_relI_PreSal_pkg;

