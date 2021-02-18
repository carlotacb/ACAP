--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;
use ieee.std_logic_textio.all;

use std.env.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.riscv32_coop_funct_pkg.all;

use work.tipos_constan_memoria_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;
use work.impri_memoria_D_pkg.all;
use work.impri_memoria_I_pkg.all;
use work.impri_BR_pkg.all;
use work.deco_inst_impri_pkg.all;
use work.Rimpri_traza_C_pkg.all;
--use work.almacenar_mem_pkg.all;

entity prueba_Rproc_MD_MI_C is 
    generic(pasoapaso: integer range 0 to 1:= 0;
			imprimir_traza: integer:= 1;
			imprimir_MD: integer:= 1;
			imprimir_MI: integer:= 1;
			imprimir_BR: integer:= 1);

end prueba_Rproc_MD_MI_C;

architecture comportamiento of prueba_Rproc_MD_MI_C is
-- para acceder al banco; tipo
--type tipo_Banco is array(0 to numRegistros-1) of std_logic_vector(tam_dat-1 downto 0);

component Rproc_MD_MI_C is
    port (reloj, Pcero: in std_logic;
--			instr:	in tipo_inst_busq;
			parar: out std_logic);
--			CP:		out tipo_direc_inst);
end component;

--signal inst: tipo_inst_busq;
signal Pcero: std_logic;
--signal CP: tipo_direc_inst;

signal parar: std_logic;
signal finaltraza: std_logic:= '0';

file S: text;

signal reloj: std_logic;
signal ciclo: integer:= 0;

shared variable final : boolean := false;
--alias contador_programa1 is << signal .prueba_Rproc_md_mi_C.procesador.regis_CP.s: tipo_direc_inst >>;
--signal cp_1, cp_2: tipo_direc_inst;

signal s_cp1: tipo_direc_inst;
signal s_proxCP: tam_dat_camino;

signal s_instruc_B, s_instruc_DL: tam_dat_camino_MI;

signal s_PBR_DL: st_PBR;
signal s_PBR_A: st_PBR;
signal s_PBR_M: st_PBR;
signal s_PBR_6: st_PBR;

signal s_opALU_DL: st_opALU;
signal s_opMD_DL: st_opMD;
signal s_opSEC_DL: st_opSEC;

signal s_opALU_A: st_opALU;
signal s_opMD_A: st_opMD;
signal s_opSEC_A: st_opSEC;

--signal s_opALU_M: st_opALU;
signal s_opMD_M: st_opMD;
--signal s_opSEC_M: st_opSEC;

--signal s_opALU_6: st_opALU;
signal s_opMD_6: st_opMD;
--signal s_opSEC_6: st_opSEC;

signal s_RS, s_RID: std_logic;


signal s_C1L1, s_C2L1, s_C3L1, s_C4L1, s_C1L2, s_C2L2, s_C3L2, s_C4L2: std_logic;

signal RS_A: std_logic:= '0';
signal RS_M: std_logic:= '0';
signal RS_F: std_logic:= '0';
signal RS_E: std_logic:= '0';

--signal RID_A: std_logic:= '0';
--signal RID_M: std_logic:= '0';
--signal RID_F: std_logic:= '0';
--signal RID_E: std_logic:= '0';

signal PBR_E: st_PBR;
signal opMD_E: st_opMD;
signal RS_8: std_logic:= '0';

------------------
signal s_fmtS:st_fmtS;
signal s_MSI: st_mSI;

signal s_fmtD: st_fmtD;
signal s_mL1: st_mL1;
signal s_mL2: st_mL2 ;
signal s_mES: st_mES;


signal s_mSIC: st_mSIC;

signal s_CoErr: std_logic;
signal s_MD_FR: std_logic;
signal s_MD_NA: std_logic;
signal s_dir_MD: tam_dat_camino;
signal s_MI_FR: std_logic;
signal s_MI_NA: std_logic;


constant programa: string := "PROGRAMA";
constant fichero: string := "../../../RESULTADOS/resultados_ejecucion_" & programa & ".txt";

begin

procesador: Rproc_MD_MI_C port map (reloj => reloj, Pcero => Pcero,
--                        instr => inst, 
parar => parar);
--						CP => CP);

-- CP
	s_cp1 <=  << signal .prueba_Rproc_md_mi_C.procesador.regis_CP.s: tipo_direc_inst >>;
	s_proxCP <= << signal .prueba_Rproc_md_mi_C.procesador.proxCP: tam_dat_camino >>; -- prueba_rproc_md_mi/procesador/regis_CP/e, prueba_rproc_md_mi/procesador/procesa/proxCP, prueba_rproc_md_mi/procesador/proxCP 

-- BUSQUEDA
----	instruc <=  << signal .prueba_proc_md_mi.procesador.Mem_INST.sal_MI: tam_dat_camino_MI >>;
	s_instruc_B <=  << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.instr: tam_dat_camino_MI >>;

-- DECODIFICACION, LECTURA BR
	s_instruc_DL <=  << signal .prueba_Rproc_md_mi_C.procesador.procesa.deco.instruc_RDL: tam_dat_camino_MI >>;

	s_PBR_DL <=  << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.banco_registros.PE: st_PBR >>;
	s_PBR_A <=  << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.banco_registros.PE_RA4: st_PBR >>;
	s_PBR_M <=  << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.banco_registros.PE_RM5: st_PBR >>;
	s_PBR_6 <=  << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.banco_registros.PE_R6: st_PBR >>;


	s_opALU_DL <= << signal .prueba_Rproc_md_mi_C.procesador.procesa.deco.opALU: st_opALU >>;
	s_opMD_DL <= << signal .prueba_Rproc_md_mi_C.procesador.procesa.deco.opMD: st_opMD >>;
	s_opSEC_DL <= << signal .prueba_Rproc_md_mi_C.procesador.procesa.deco.opSEC: st_opSEC >>;


	s_opALU_A <= << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.alu_map.opALU_RA4 : st_opALU >>;
	s_opMD_A <= << signal .prueba_Rproc_md_mi_C.procesador.Mem_DATOS.opMD_RA4: st_opMD >>;
	s_opSEC_A <= << signal .prueba_Rproc_md_mi_C.procesador.procesa.control.opSEC_RA4: st_opSEC >>;

	s_opMD_M <= << signal .prueba_Rproc_md_mi_C.procesador.Mem_DATOS.Rform_lec.opMD_RM5: st_opMD >>;

	s_opMD_6 <= << signal .prueba_Rproc_md_mi_C.procesador.Mem_DATOS.Rform_lec.opMD_R6: st_opMD >>;

	s_RS <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.RS: std_logic >>;
	s_RID <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.RID: std_logic >>;

-- CORTOCIRCUITOS
	s_C1L1 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C1L1: std_logic >>;
	s_C2L1 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C2L1: std_logic >>;
	s_C3L1 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C3L1: std_logic >>;
	s_C4L1 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C4L1: std_logic >>;

	s_C1L2 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C1L2: std_logic >>;
	s_C2L2 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C2L2: std_logic >>;
	s_C3L2 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C3L2: std_logic >>;
	s_C4L2 <= << signal .prueba_Rproc_md_mi_C.procesador.logica_LIB.C4L2: std_logic >>;

estimulos: process is

variable linea_S : line;
variable l : line;

alias mem_datos is << signal .prueba_Rproc_md_mi_C.procesador.Mem_DATOS.Rmem_dat.ram: t_ramD >>; 

begin
	Pcero <= '1';
--	almacenar_memoria("../../../CODIGO/suma_dmem.hex",mem_datos);
	wait until reloj'event and reloj ='1';
	wait until reloj'event and reloj ='0';
--	liberar_memoria("../../../CODIGO/suma_dmem.hex",mem_datos);
--	wait until reloj'event and reloj ='1';

	Pcero <= '0';
	if (imprimir_traza = 1 or imprimir_MD = 1 or imprimir_MI = 1 or imprimir_BR = 1) then
		file_open(S,fichero,write_mode); 
		file_close(S);
	end if;
	if imprimir_traza = 1 then
		cabecera_traza (fichero);
	end if;

--	wait until reloj'event and reloj ='1';

--	wait until reloj'event and reloj ='1';

--	 final := true;
	wait;
        
end process;


traza: if imprimir_traza = 1 generate
impri_instruc: process(reloj) is
variable l : line;
variable linea_S : line;

variable v_cp1: tipo_direc_inst;
variable v_proxCP: tam_dat_camino;

variable v_instruc_B, v_instruc_DL: tam_dat_camino_MI;

variable v_PBR_DL: st_PBR;
variable v_PBR_A: st_PBR;
variable v_PBR_M: st_PBR;
variable v_PBR_6: st_PBR;

variable v_opALU_DL: st_opALU;
variable v_opMD_DL: st_opMD;
variable v_opSEC_DL: st_opSEC;

variable v_opALU_A: st_opALU;
variable v_opMD_A: st_opMD;
variable v_opSEC_A: st_opSEC;

--variable v_opALU_M: st_opALU;
variable v_opMD_M: st_opMD;
--variable v_opSEC_M: st_opSEC;

--variable v_opALU_6: st_opALU;
variable v_opMD_6: st_opMD;
--variable v_opSEC_6: st_opSEC;

variable v_RS, v_RID: std_logic;

variable v_C1L1, v_C2L1, v_C3L1, v_C4L1, v_C1L2, v_C2L2, v_C3L2, v_C4L2: std_logic;

variable ciclod:integer;

--variable RS_A: std_logic:= '0';
--variable RS_M: std_logic:= '0';
--variable RS_F: std_logic:= '0';

--variable RID_A: std_logic:= '0';
--variable RID_M: std_logic:= '0';
--variable RID_F: std_logic:= '0';

begin
	if reloj'event and reloj ='1' then
		if ciclo >= 2 and finaltraza = '0' then

		v_cp1:= s_cp1'delayed(0 fs);
		v_proxCP:= s_proxCP'delayed(0 fs);

		v_instruc_B:= s_instruc_B'delayed(0 fs);
		v_instruc_DL:= s_instruc_DL'delayed(0 fs);

		v_PBR_DL:= s_PBR_DL'delayed(0 fs);
		v_PBR_A:= s_PBR_A'delayed(0 fs);
		v_PBR_M:= s_PBR_M'delayed(0 fs);
		v_PBR_6:= s_PBR_6'delayed(0 fs);

		v_opALU_DL:= s_opALU_DL'delayed(0 fs);
		v_opMD_DL:= s_opMD_DL'delayed(0 fs);
		v_opSEC_DL:= s_opSEC_DL'delayed(0 fs);

		v_opALU_A:= s_opALU_A'delayed(0 fs);
		v_opMD_A:= s_opMD_A'delayed(0 fs);
		v_opSEC_A:= s_opSEC_A'delayed(0 fs);

--		v_opALU_M:= s_opALU_M'delayed(0 fs);
		v_opMD_M:= s_opMD_M'delayed(0 fs);
--		v_opSEC_M:= s_opSEC_M'delayed(0 fs);

--		v_opALU_6:= s_opALU_6'delayed(0 fs);
		v_opMD_6:= s_opMD_6'delayed(0 fs);
--		v_opSEC_6:= s_opSEC_6'delayed(0 fs);

		v_RS:= s_RS'delayed(0 fs);
		v_RID:= s_RID'delayed(0 fs);

		v_C1L1:= s_C1L1'delayed(0 fs);
		v_C2L1:= s_C2L1'delayed(0 fs);
		v_C3L1:= s_C3L1'delayed(0 fs);
		v_C4L1:= s_C4L1'delayed(0 fs);

		v_C1L2:= s_C1L2'delayed(0 fs);
		v_C2L2:= s_C2L2'delayed(0 fs);
		v_C3L2:= s_C3L2'delayed(0 fs);
		v_C4L2:= s_C4L2'delayed(0 fs);

			ciclod:= ciclo'delayed(0 fs);
--			report "ciclo***  " & integer'image(ciclo);
--			report "ciclod***  " & integer'image(ciclod);
--			impri_traza_instruc (v_proxCP, v_instruc_B, v_instruc_DL, v_RS, RS_A, RS_M, RS_F, RS_E, RS_8, v_RID, RID_A, RID_M, RID_F, RID_E, v_opALU_A, v_opMD_A, v_opMD_M, v_opMD_6, opMD_E, v_opSEC_A, v_PBR_A, v_PBR_M, 
--									 v_PBR_6, PBR_E, 
--		 							ciclod, fichero);
			impri_traza_instruc (v_proxCP, v_instruc_B, v_instruc_DL, v_RS, RS_A, RS_M, RS_F, RS_E, RS_8, v_RID, v_opALU_A, v_opMD_A, v_opMD_M, v_opMD_6, opMD_E, v_opSEC_A, v_PBR_A, v_PBR_M, 
									 v_PBR_6, PBR_E, 
									v_C1L1, v_C2L1, v_C3L1, v_C4L1, v_C1L2, v_C2L2, v_C3L2, v_C4L2,
		 							ciclod, fichero);
		end if;
		if v_RID = '1' then
			RS_A <= '0';
		else
			RS_A <= v_RS;
		end if;
		RS_M <= RS_A;
		RS_F <= RS_M;
		RS_E <= RS_F;
		RS_8 <= RS_E;

--		RID_A <= v_RID;
--		RID_M <= RID_A;
--		RID_F <= RID_M;
--		RID_E <= RID_F;

		PBR_E <= v_PBR_6;
		opMD_E <= v_opMD_6;

		if parar = '1' then
			finaltraza <= '1';
		end if;
	end if;

end process;
end generate traza;



finalizar: process (reloj, parar) is
--constant fichero: string := "../../../RESULTADOS/resultados_ejecucion.txt";
alias mem_datos is << signal .prueba_Rproc_md_mi_C.procesador.Mem_DATOS.Rmem_dat.ram: t_ramD >>;
alias mem_inst is << signal .prueba_Rproc_md_mi_C.procesador.Mem_INST.Mem_INSTR.mem_inst.ram: t_ramI >>;
alias B_registros is << signal .prueba_Rproc_md_mi_C.procesador.procesa.cam_datos.banco_registros.R_BR.Banco_R: tipo_Banco >>;
begin
	if reloj'event and reloj ='0' then
		if parar = '1' and finaltraza = '1' then
			final := true;
			if imprimir_MD = 1 then
				impri_memoria(mem_datos, fichero);
			end if;
			if imprimir_MI = 1 then
				impri_memoria_I(mem_inst, fichero);
			end if;
			if imprimir_BR = 1 then
				impri_BR(B_registros, fichero);
			end if;
		end if;
	end if;

end process;

etiqciclo: if pasoapaso = 1 generate
relojciclo: process  is
begin
  if final = false then
	reloj <= '0';
	wait for 40 ns;
	ciclo <= ciclo +1;
	reloj <= '1';
	wait for 40 ns;
	stop(0);
  else
	wait;
  end if;
end process relojciclo;
end generate etiqciclo;

etiqeje: if pasoapaso = 0 generate
relojeje: process  is
begin
  if final = false then
	reloj <= '0';
	wait for 40 ns;
	ciclo <= ciclo +1;
	reloj <= '1';
	wait for 40 ns;
--	stop(0);
  else
	wait;
  end if;
end process relojeje;
end generate etiqeje;

end;



