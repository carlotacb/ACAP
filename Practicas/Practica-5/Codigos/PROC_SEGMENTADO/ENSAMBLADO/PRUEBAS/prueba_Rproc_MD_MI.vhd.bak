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
use work.impri_traza_pkg.all;

entity prueba_Rproc_MD_MI is 
    generic (periodo_reloj: time := 80 ns;
			pasoapaso: boolean := true; --false;
			imprimir_traza: boolean:= true;
			imprimir_MD: boolean:= true;
			imprimir_MI: boolean:= true;
			imprimir_BR: boolean:= true);
end prueba_Rproc_MD_MI;

architecture comportamiento of prueba_Rproc_MD_MI is

component Rproc_MD_MI is
    port (reloj, Pcero: in std_logic;
			parar: out std_logic);
end component;

signal Pcero: std_logic;

signal parar: std_logic;
signal finaltraza: std_logic:= '0';

file S: text;

signal reloj: std_logic;
signal ciclo: integer:= 0;

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

signal s_opMD_M: st_opMD;

signal s_opMD_6: st_opMD;


signal s_RS, s_RID: std_logic;


signal RS_A: std_logic:= '0';
signal RS_M: std_logic:= '0';
signal RS_F: std_logic:= '0';
signal RS_E: std_logic:= '0';


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

constant codihex: string := "../../../PRUEBAS/CODI_imem.hex";
constant dadeshex: string := "../../../PRUEBAS/DADES_dmem.hex";
constant dir_resultats: string := "../../../RESULTADOS/";
constant prefix: string := "resultados_ejecucion_";
constant sufix: string := ".txt";
constant ncodi: string := nom_programa(codihex);
constant ndades: string := nom_programa(dadeshex);
constant fichero: string := dir_resultats & prefix & nom_programa(codihex) & sufix;

begin

procesador: Rproc_MD_MI port map (reloj => reloj, Pcero => Pcero, parar => parar);

-- CP
	s_cp1 <=  << signal .prueba_rproc_md_mi.procesador.regis_CP.s: tipo_direc_inst >>;
	s_proxCP <= << signal .prueba_rproc_md_mi.procesador.proxCP: tam_dat_camino >>;  

-- BUSQUEDA
	s_instruc_B <=  << signal .prueba_rproc_md_mi.procesador.procesa.cam_datos.instr: tam_dat_camino_MI >>;

-- DECODIFICACION, LECTURA BR
	s_instruc_DL <=  << signal .prueba_rproc_md_mi.procesador.procesa.deco.instruc_RDL: tam_dat_camino_MI >>;

	s_PBR_DL <=  << signal .prueba_rproc_md_mi.procesador.procesa.cam_datos.banco_registros.PE: st_PBR >>;
	s_PBR_A <=  << signal .prueba_rproc_md_mi.procesador.procesa.cam_datos.banco_registros.PE_RA4: st_PBR >>;
	s_PBR_M <=  << signal .prueba_rproc_md_mi.procesador.procesa.cam_datos.banco_registros.PE_RM5: st_PBR >>;
	s_PBR_6 <=  << signal .prueba_rproc_md_mi.procesador.procesa.cam_datos.banco_registros.PE_R6: st_PBR >>;


	s_opALU_DL <= << signal .prueba_rproc_md_mi.procesador.procesa.deco.opALU: st_opALU >>;
	s_opMD_DL <= << signal .prueba_rproc_md_mi.procesador.procesa.deco.opMD: st_opMD >>;
	s_opSEC_DL <= << signal .prueba_rproc_md_mi.procesador.procesa.deco.opSEC: st_opSEC >>;


	s_opALU_A <= << signal .prueba_rproc_md_mi.procesador.procesa.cam_datos.alu_map.opALU_RA4 : st_opALU >>;
	s_opMD_A <= << signal .prueba_rproc_md_mi.procesador.Mem_DATOS.opMD_RA4: st_opMD >>;
	s_opSEC_A <= << signal .prueba_rproc_md_mi.procesador.procesa.control.opSEC_RA4: st_opSEC >>;

	s_opMD_M <= << signal .prueba_rproc_md_mi.procesador.Mem_DATOS.Rform_lec.opMD_RM5: st_opMD >>;

	s_opMD_6 <= << signal .prueba_rproc_md_mi.procesador.Mem_DATOS.Rform_lec.opMD_R6: st_opMD >>;

	s_RS <= << signal .prueba_rproc_md_mi.procesador.logica_LIB.RS: std_logic >>;
	s_RID <= << signal .prueba_rproc_md_mi.procesador.logica_LIB.RID: std_logic >>;


ini: process is
variable l: line;
begin
	assert ncodi = ndades report "ERROR: ficheros CODI != DADES" severity failure;

	if (imprimir_traza or imprimir_MD or imprimir_MI or imprimir_BR) then
		file_open(S,string(fichero),write_mode); 
		file_close(S);
	end if;
	if imprimir_traza then
		cabecera_traza (fichero, ncodi);
	end if;
	wait;
end process;

estimulos: process is

variable linea_S : line;
variable l : line;

begin
	Pcero <= '1';
	wait until reloj'event and reloj ='1';
	wait until reloj'event and reloj ='0';
	Pcero <= '0';
	wait;
        
end process;


traza: if imprimir_traza generate
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

variable v_opMD_M: st_opMD;

variable v_opMD_6: st_opMD;

variable v_RS, v_RID: std_logic;

variable ciclod:integer;

begin
	if reloj'event and reloj ='1' then
		if ciclo >= 2 then

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

		v_opMD_M:= s_opMD_M'delayed(0 fs);

		v_opMD_6:= s_opMD_6'delayed(0 fs);

		v_RS:= s_RS'delayed(0 fs);
		v_RID:= s_RID'delayed(0 fs);

			ciclod:= ciclo'delayed(0 fs);
			impri_traza_instruc (v_proxCP, v_instruc_B, v_instruc_DL, v_RS, RS_A, RS_M, RS_F, RS_E, RS_8, v_RID, v_opALU_A, v_opMD_A, v_opMD_M, v_opMD_6, opMD_E, v_opSEC_A, v_PBR_A, v_PBR_M, 
									 v_PBR_6, PBR_E, 
		 							ciclod, string(fichero));
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

		PBR_E <= v_PBR_6;
		opMD_E <= v_opMD_6;

	end if;

end process;
end generate traza;



finalizar: process is
variable l: line;
alias mem_datos is << signal .prueba_Rproc_md_mi.procesador.Mem_DATOS.Rmem_dat.ram: t_ramD >>;
alias mem_inst is << signal .prueba_Rproc_md_mi.procesador.Mem_INST.Mem_INSTR.mem_inst.ram: t_ramI >>;
alias B_registros is << signal .prueba_Rproc_md_mi.procesador.procesa.cam_datos.banco_registros.R_BR.Banco_R: tipo_Banco >>;
begin
	wait until finaltraza = '1';
	wait for 0 ps;
	if imprimir_MD then
		impri_memoria(mem_datos, string(fichero));
	end if;
	if imprimir_MI then
		impri_memoria_I(mem_inst, string(fichero));
	end if;
	if imprimir_BR then
		impri_BR(B_registros, string(fichero));
	end if;
	write (l, string(LF & LF & "CODI: " & ncodi));
 	writeline (output, l);
	write (l, string("DADES: " & ndades));
	writeline (output, l);

	if (imprimir_traza or imprimir_MD or imprimir_MI or imprimir_BR) then
		write (l, string("Fichero resultados: " & string(fichero)));
		writeline (output, l);
	end if;
end process;

relojeje: process  is
begin
	reloj <= '0';
	wait for periodo_reloj/2;
	ciclo <= ciclo + 1;
	reloj <= '1';
	if parar = '1' then
		finaltraza <= '1';
		wait;
	end if;
	if pasoapaso then
		stop(0);
	end if;
	wait for periodo_reloj - periodo_reloj/2;
end process relojeje;

end;



