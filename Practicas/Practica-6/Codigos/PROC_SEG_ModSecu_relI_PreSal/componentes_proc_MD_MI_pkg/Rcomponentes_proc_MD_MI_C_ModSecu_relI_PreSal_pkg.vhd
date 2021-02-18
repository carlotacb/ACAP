--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package Rcomponentes_proc_MD_MI_C_ModSecu_relI_PreSal_pkg is

component RDeco_cam_dat_secu_C_ModSecu_relI_PreBra is
    port (reloj, pcero, B, I: std_logic;
	 		C1L1, C2L1, C1L2, C2L2, C3L1, C4L1, C3L2, C4L2: std_logic;
			instr:	in tipo_inst_busq;
			CP:		in tipo_direc_inst;
			mD_mES:	in tam_dat_camino;
			alu_dir: out tam_dat_camino;
			opMD: 	out st_opMD;
			L2:		out tam_dat_camino;
			proxCP:		out tipo_direc_inst;
			ErPre: out std_logic;
			CoErr: out std_logic;
			MI_FR: out std_logic;
			MI_NA: out std_logic);
end component;

end package Rcomponentes_proc_MD_MI_C_ModSecu_relI_PreSal_pkg;
