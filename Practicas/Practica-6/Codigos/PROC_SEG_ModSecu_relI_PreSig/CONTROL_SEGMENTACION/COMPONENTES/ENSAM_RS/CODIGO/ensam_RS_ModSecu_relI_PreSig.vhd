--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

use work.componentes_control_seg_ModSecu_relI_PreSecu_pkg.all;
use work.componentes_control_seg_ModSecu_relI_PreSig_pkg.all;

use work.retardos_cntl_seg_pkg.all;

entity ensam_RS_ModSecu_relI_PreSig is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		SInCond: in st_SInCond;
		SCond: in std_logic;
		Pred: in st_Pred;
		RS : out std_logic);
end ensam_RS_ModSecu_relI_PreSig;


architecture estructural of ensam_RS_ModSecu_relI_PreSig is
signal opsecA: st_opSEC;
signal SCondA: std_logic;

begin

	senyales_cntl: senya_cntlRS_ModSecu_relI_PreSecu port map(reloj => reloj, pcero => pcero, I => I, opsec => opsec, SCond => SCond, SCondA => SCondA, opsecA => opsecA);

	R_sec: LDRS_ModSecu_relI_PreSig port map (opsecDL => opsec, opsecA => opsecA, SInCond => SInCond, SCond => SCond, SCondA => SCondA, Pred => Pred, RS => RS);

end estructural;
