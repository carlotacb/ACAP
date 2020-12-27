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
use work.tipos_constan_memoria_pkg.all;
use work.componentes_proc_MD_MI_pkg.all;
--! @image html proc_MD_MI.png

entity proc_MD_MI is
    port (reloj, Pcero: in std_logic;
			parar: out std_logic);
end proc_MD_MI;

architecture estructural of proc_MD_MI is
 
signal t_CP, proxCP: tipo_direc_inst;
signal mD_mES: tam_dat_camino;
signal L1, L2: tam_dat_camino;
signal alu_dir: tam_dat_camino;
signal opMD:st_opMD;
signal MD_FR, MD_NA: std_logic;
signal CoErr: std_logic;
signal instr: tipo_inst_busq;
signal MI_FR, MI_NA: std_logic;

begin

regis_CP: regCP port map(reloj => reloj, Pcero => Pcero, e => proxCP, s => t_CP);

Mem_INST: cam_MEM_INST port map(direc_MI => t_CP, sal_MI => instr);

procesa: Deco_cam_dat_secu port map(reloj => reloj, instr => instr, CP => t_CP, mD_mES => mD_mES, alu_dir => alu_dir, opMD => opMD, L2 => L2, proxCP => proxCP, CoErr => CoErr, MI_FR => MI_FR, MI_NA => MI_NA);

Mem_DATOS: cam_MEM_DATOS port map(reloj => reloj, ent_MD => L2, direc_MD => alu_dir, opMD => opMD, sal_MD => mD_mES, MD_FR => MD_FR, MD_NA => MD_NA);

parar <= CoErr or MD_FR or MD_NA or MI_FR or MI_NA;

end;


