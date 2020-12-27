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

entity prueba_proc_MD_MI_alu is 
    generic (periodo_reloj: time := 80 ns;
			pasoapaso: boolean := true; --false;
			imprimir_traza: boolean:= true;
			imprimir_MD: boolean:= true;
			imprimir_MI: boolean:= true;
			imprimir_BR: boolean:= true);
end prueba_proc_MD_MI_alu;

architecture comportamiento of prueba_proc_MD_MI_alu is

component proc_MD_MI_alu is
    port (reloj, Pcero: in std_logic;
			parar: out std_logic);
end component;

signal Pcero: std_logic;

signal parar: std_logic;
signal finaltraza: std_logic:= '0';

file S: text;

signal reloj: std_logic;
signal ciclo: integer:= 0;

signal cp1: tipo_direc_inst;
signal instruc: tam_dat_camino_MI;
signal s_fmtS:st_fmtS;
signal s_MSI: st_mSI;
signal s_PBR: st_PBR;
signal s_fmtD: st_fmtD;
signal s_mL1: st_mL1;
signal s_mL2: st_mL2 ;
signal s_mES: st_mES;
signal s_opALU: st_opALU;
signal s_opMD: st_opMD;
signal s_opSEC: st_opSEC;

signal s_mSIC: st_mSIC;

signal s_CoErr: std_logic;
signal s_MD_FR: std_logic;
signal s_MD_NA: std_logic;
signal s_dir_MD: tam_dat_camino;
signal s_MI_FR: std_logic;
signal s_MI_NA: std_logic;
signal s_proxCP: tam_dat_camino;

constant codihex: string := "../../../PRUEBAS/CODI_imem.hex";
constant dadeshex: string := "../../../PRUEBAS/DADES_dmem.hex";
constant dir_resultats: string := "../../../RESULTADOS/";
constant prefix: string := "resultados_ejecucion_";
constant sufix: string := ".txt";
constant ncodi: string := nom_programa(codihex);
constant ndades: string := nom_programa(dadeshex);
constant fichero: string := dir_resultats & prefix & nom_programa(codihex) & sufix;

begin

procesador: proc_MD_MI_alu port map (reloj => reloj, Pcero => Pcero, parar => parar);

	cp1 <=  << signal .prueba_proc_md_mi_alu.procesador.regis_CP.s: tipo_direc_inst >>;
	instruc <=  << signal .prueba_proc_md_mi_alu.procesador.Mem_INST.sal_MI: tam_dat_camino_MI >>;
	s_fmtS <=  << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.fmtS: st_fmtS >>;
	s_MSI <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.MSI: st_mSI >>;
	s_PBR <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.PBR: st_PBR >>;
	s_fmtD <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.fmtD: st_fmtD >>;
	s_mL1 <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.mL1: st_mL1 >>;
	s_mL2 <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.mL2: st_mL2 >>;
	s_mES <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.mES: st_mES >>;
	s_opALU <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.opALU: st_opALU >>;
	s_opMD <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.opMD: st_opMD >>;
	s_opSEC <= << signal .prueba_proc_md_mi_alu.procesador.procesa.deco.opSEC: st_opSEC >>;

	s_mSIC <= << signal .prueba_proc_md_mi_alu.procesador.procesa.cam_secuen.mSIC: st_mSIC >>;

	s_CoErr <= << signal .prueba_proc_md_mi_alu.procesador.CoErr: std_logic >>;
	s_MD_FR <= << signal .prueba_proc_md_mi_alu.procesador.MD_FR: std_logic >>;
	s_MD_NA <= << signal .prueba_proc_md_mi_alu.procesador.MD_NA: std_logic >>;
	s_dir_MD <= << signal .prueba_proc_md_mi_alu.procesador.procesa.cam_datos.alu_map.s: tam_dat_camino >>;
	s_MI_FR <= << signal .prueba_proc_md_mi_alu.procesador.MI_FR: std_logic >>;
	s_MI_NA <= << signal .prueba_proc_md_mi_alu.procesador.MI_NA: std_logic >>;
	s_proxCP <= << signal .prueba_proc_md_mi_alu.procesador.proxCP: tam_dat_camino >>;


ini: process is
variable l: line;
begin
	report "fitxer CODI: " & nom_programa(codihex);
	report "fitxer DADES: " & nom_programa(dadeshex);
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

variable linea_S: line;
variable l: line;
begin
	Pcero <= '1';
	wait until reloj'event and reloj = '1';
	Pcero <= '1';
	wait until reloj'event and reloj ='0';
	Pcero <= '0';
	wait;
end process;

traza: if imprimir_traza generate
impri_instruc: process(reloj) is
variable l: line;
variable linea_S: line;

variable v_cp2d: tipo_direc_inst;
variable v_instrucd: tam_dat_camino_MI;
variable v_fmtSd: st_fmtS;
variable v_MSId: st_mSI;
variable v_PBRd: st_PBR;
variable v_fmtDd: st_fmtD;
variable v_mL1d: st_mL1;
variable v_mL2d: st_mL2 ;
variable v_mESd: st_mES;
variable v_opALUd: st_opALU;
variable v_opMDd: st_opMD;
variable v_opSECd: st_opSEC;

variable v_mSICd: st_mSIC;

variable v_CoErrd: std_logic;
variable v_MD_FRd: std_logic;
variable v_MD_NAd: std_logic;
variable v_dir_MDd: tam_dat_camino;
variable v_MI_FRd: std_logic;
variable v_MI_NAd: std_logic;
variable v_proxCPd: tam_dat_camino;

variable ciclod: integer;

begin
	if reloj'event and reloj ='1' then
		if Pcero = '0' then

			v_cp2d := cp1'delayed(0 fs);
			v_instrucd := instruc'delayed(0 fs);
			v_fmtSd := s_fmtS'delayed(0 fs);
			v_MSId := s_MSI'delayed(0 fs);
			v_PBRd := s_PBR'delayed(0 fs);
			v_fmtDd := s_fmtD'delayed(0 fs);
			v_mL1d := s_mL1'delayed(0 fs);
			v_mL2d := s_mL2'delayed(0 fs) ;
			v_mESd := s_mES'delayed(0 fs);
			v_opALUd := s_opALU'delayed(0 fs);
			v_opMDd := s_opMD'delayed(0 fs);
			v_opSECd := s_opSEC'delayed(0 fs);

			v_mSICd := s_mSIC'delayed(0 fs);

			v_CoErrd := s_CoErr'delayed(0 fs);
			v_MD_FRd := s_MD_FR'delayed(0 fs);
			v_MD_NAd := s_MD_NA'delayed(0 fs);
			v_dir_MDd := s_dir_MD'delayed(0 fs);
			v_MI_FRd := s_MI_FR'delayed(0 fs);
			v_MI_NAd := s_MI_NA'delayed(0 fs);
			v_proxCPd := s_proxCP'delayed(0 fs);

			ciclod:= ciclo'delayed(0 fs);

			impri_traza_instruc (v_cp2d, v_instrucd, v_fmtSd, v_MSId, v_PBRd, v_fmtDd, v_mL1d, v_mL2d, v_mESd, v_opALUd, v_opMDd, v_opSECd, v_mSICd, v_CoErrd, v_MD_FRd, v_MD_NAd, v_dir_MDd, v_MI_FRd, v_MI_NAd, v_proxCPd, ciclod, string(fichero));
		end if;

	end if;

end process;
end generate traza;

finalizar: process is
variable l: line;
alias mem_datos is << signal .prueba_proc_md_mi_alu.procesador.Mem_DATOS.mem_dat.ram: t_ramD >>;
alias mem_inst is << signal .prueba_proc_md_mi_alu.procesador.Mem_INST.mem_inst.ram: t_ramI >>;
alias B_registros is << signal .prueba_proc_md_mi_alu.procesador.procesa.cam_datos.banco_registros.Banco_R: tipo_Banco >>;
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



