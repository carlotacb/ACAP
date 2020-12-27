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

package componentes_proc_MD_MI_pkg is

component regCP is							-- registro con inicializacion a cero asincrona
	port (reloj, Pcero: in std_logic;		-- Pcero: senyal de inicializacion
         e: in tipo_direc_inst;
         s: out tipo_direc_inst);
end component;

component Deco_cam_dat_secu is
    port (reloj: std_logic;
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

component cam_MEM_DATOS is
port(reloj: in std_logic;
	ent_MD: in tam_dat_camino_MD; 
	direc_MD: in tam_dat_camino_MD; 
	opMD: in st_opMD;
	sal_MD: out tam_dat_camino_MD;
	MD_FR: out std_logic;
	MD_NA: out std_logic);
end component;

component cam_MEM_INST is 
port(direc_MI: in tam_dat_camino_MI; 
	sal_MI: out tam_dat_camino_MI);
end component;

end package componentes_proc_MD_MI_pkg;
