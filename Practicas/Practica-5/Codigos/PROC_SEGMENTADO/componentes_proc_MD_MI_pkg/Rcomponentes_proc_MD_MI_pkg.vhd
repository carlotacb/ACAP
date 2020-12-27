--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;

package Rcomponentes_proc_MD_MI_pkg is

component RregCP is							-- registro con inicializacion a cero asincrona
	port (reloj, Pcero, B: in std_logic;		-- Pcero: senyal de inicializacion
         e: in tipo_direc_inst;
         s: out tipo_direc_inst);
end component;

component RDeco_cam_dat_secu is
    port (reloj, pcero, B, I: std_logic;
			instr:	in tipo_inst_busq;
			CP:		in tipo_direc_inst;
			mD_mES:	in tam_dat_camino;
			alu_dir: out tam_dat_camino;
			opMD: 	out st_opMD;
			L2:		out tam_dat_camino;
			proxCP:		out tipo_direc_inst;
			CoErr: out std_logic;
			MI_FR: out std_logic;
			MI_NA: out std_logic);
end component;

component Rcam_MEM_DATOS is
port(reloj, pcero, I: in std_logic;
	ent_MD: in tam_dat_camino_MD; 
	direc_MD: in tam_dat_camino_MD; 
	opMD: in st_opMD;
	sal_MD: out tam_dat_camino_MD;
	MD_FR: out std_logic;
	MD_NA: out std_logic);
end component;

component Rcam_MEM_INST_INY_Pcero is
    port (reloj, Pcero: in std_logic;
			CP, proxCP: in tipo_direc_inst;
			bloqCP, inyecBDL: in std_logic;
			instr:	out tipo_inst_busq);
end component;

end package Rcomponentes_proc_MD_MI_pkg;
