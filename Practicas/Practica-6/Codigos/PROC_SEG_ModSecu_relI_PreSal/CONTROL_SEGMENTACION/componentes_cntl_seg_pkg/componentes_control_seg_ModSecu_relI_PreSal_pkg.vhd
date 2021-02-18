--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_control_seg_ModSecu_relI_PreSal_pkg is

component LDRS_ModSecu_relI_PreSal is
	port(opsecDL, opsecA : in st_opSEC;
		SInCond: in st_SInCond;
		SCond, SCondA: in std_logic;
		RS: out std_logic);
end component;

component ensam_RS_ModSecu_relI_PreSal is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		SInCond: in st_SInCond;
		SCond: in std_logic;
		RS : out std_logic);
end component;

end package componentes_control_seg_ModSecu_relI_PreSal_pkg;

