--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreSig_pkg.all;

use work.tipos_constan_memoria_pkg.all;
use work.Rcomponentes_proc_MD_MI_pkg.all;
use work.Rcomponentes_proc_MD_MI_C_pkg.all;
use work.Rcomponentes_proc_MD_MI_C_ModSecu_relI_PreSal_pkg.all;
use work.Rcomponentes_proc_MD_MI_C_ModSecu_relI_PreSig_pkg.all;

use work.componentes_control_seg_ModSecu_relI_PreSecu_pkg.all;
use work.componentes_control_seg_C_ModSecu_relI_PreSig_pkg.all;

entity Rproc_MD_MI_C_ModSecu_relI_PreSig is
    port (reloj, Pcero: in std_logic;
			parar: out std_logic);
end Rproc_MD_MI_C_ModSecu_relI_PreSig;

architecture estructural of Rproc_MD_MI_C_ModSecu_relI_PreSig is

signal t_CP, proxCP, CP_MI_1, CP_MI: tipo_direc_inst;
signal mD_mES: tam_dat_camino;
signal L1, L2: tam_dat_camino;
signal alu_dir: tam_dat_camino;
signal opMD:st_opMD;
signal MD_FR, MD_NA: std_logic;
signal CoErr: std_logic;
signal instr_1, instr: tipo_inst_busq;
signal MI_FR, MI_NA: std_logic;

signal bloqCP, bloqBDL, inyecBDL, inyecDLA: std_logic;
signal C1L1, C2L1, C3L1, C4L1, C1L2, C2L2, C3L2, C4L2: std_logic;

signal ErPre: std_logic;
signal Pred: st_Pred;
begin

regis_CP: RregCP port map(reloj => reloj, Pcero => Pcero, B => bloqCP, e => proxCP, s => t_CP);

Mem_INST: Rcam_MEM_INST_INY_Pcero port map(reloj => reloj, Pcero => Pcero, CP => t_CP, proxCP => proxCP, bloqCP => bloqCP, inyecBDL => inyecBDL, instr => instr);

procesa: RDeco_cam_dat_secu_C_ModSecu_relI_PreSig port map(reloj => reloj, pcero => pcero, B => bloqBDL, I => inyecDLA, 
										C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2,
										instr => instr, CP => t_CP, mD_mES => mD_mES, alu_dir => alu_dir, opMD => opMD, L2 => L2, proxCP => proxCP, ErPre => ErPre, Pred => Pred, 
										CoErr => CoErr, MI_FR => MI_FR, MI_NA => MI_NA);

Mem_DATOS: Rcam_MEM_DATOS_C port map(reloj => reloj, pcero => pcero, I => inyecDLA, ent_MD => L2, direc_MD => alu_dir, opMD => opMD, sal_MD => mD_mES, MD_FR => MD_FR, MD_NA => MD_NA);

logica_LIB: LIB_C_ModSecu_relI_PreSig port map (reloj => reloj, pcero => pcero, B => bloqBDL, I => inyecDLA, instruc => instr, ErPre => ErPre, Pred => Pred,
						C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2,
						bloqCP => bloqCP , bloqBDL => bloqBDL , inyecBDL => inyecBDL, inyecDLA => inyecDLA);
						
parar <= CoErr or MD_FR or MD_NA or MI_FR or MI_NA;

end;


