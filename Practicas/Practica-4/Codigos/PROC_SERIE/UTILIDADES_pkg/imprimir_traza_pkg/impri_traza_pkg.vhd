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
use work.deco_inst_impri_pkg.all;

package impri_traza_pkg is
impure function nom_programa (nom_fitxer: string) return string;
procedure cabecera_traza (fichero, programa: in string);
procedure impri_traza_instruc (v_cp2d: tipo_direc_inst; v_instrucd: tam_dat_camino_MI; v_fmtSd: st_fmtS; v_MSId: st_mSI; v_PBRd: st_PBR; v_fmtDd: st_fmtD;
 							v_mL1d: st_mL1; v_mL2d: st_mL2 ; v_mESd: st_mES; v_opALUd: st_opALU; v_opMDd: st_opMD; v_opSECd: st_opSEC;
 							v_mSICd: st_mSIC;
 							v_CoErrd: std_logic; v_MD_FRd: std_logic; v_MD_NAd: std_logic; v_dir_MDd: tam_dat_camino; v_MI_FRd: std_logic; v_MI_NAd: std_logic; v_proxCPd: tam_dat_camino;
 							ciclod:integer; fichero: in string);
end package impri_traza_pkg;

package body impri_traza_pkg is

impure function nom_programa (nom_fitxer: string) return string is
file fitxer: text;
variable lc: line;
begin
	file_open (fitxer, nom_fitxer, read_mode);
	readline (fitxer, lc);
	file_close (fitxer);
	return string(lc.all);
end function nom_programa;

procedure cabecera_traza (fichero, programa: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
		write (l, string'("PROGRAMA: " & programa & LF));
		write (l, string'(" salida de comprobacion del decodificador, DECS y senyales de ERROR"));
		linea_S := new string'(l.all);
		writeline (output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("ciclo"), right, 5);
		write (l, string'("CP"), right, 8);
		write (l, string'("inst hexa"), right, 12);
		write (l, string'("inst ascii"), right, 20);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("MSI"), right, 58);
		write (l, string'("fmtD"), right, 5);
		write (l, string'("mL2"), right, 5);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("fmtS"), right, 56);
		write (l, string'("PBR"), right, 4);
		write (l, string'("mL1"), right, 6);
		write (l, string'("mES"), right, 5);
		write (l, string'("opALU"), right, 7);
		write (l, string'("opMD"), right, 5);
		write (l, string'("opSEC"), right, 6);

		write (l, string'("mSIC"), right, 6);

		write (l, string'("CoErr"), right, 8);
		write (l, string'("MD_FR"), right, 6);
		write (l, string'("MD_FA"), right, 6);
		write (l, string'("dir_MD"), right, 10);
		write (l, string'("MI_FR"), right, 10);
		write (l, string'("MI_FA"), right, 6);
		write (l, string'("prox_CP"), right, 10);

		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
end procedure cabecera_traza;  


procedure impri_traza_instruc (v_cp2d: tipo_direc_inst; v_instrucd: tam_dat_camino_MI; v_fmtSd: st_fmtS; v_MSId: st_mSI; v_PBRd: st_PBR; v_fmtDd: st_fmtD;
 							v_mL1d: st_mL1; v_mL2d: st_mL2 ; v_mESd: st_mES; v_opALUd: st_opALU; v_opMDd: st_opMD; v_opSECd: st_opSEC;
 							v_mSICd: st_mSIC;
 							v_CoErrd: std_logic; v_MD_FRd: std_logic; v_MD_NAd: std_logic; v_dir_MDd: tam_dat_camino; v_MI_FRd: std_logic; v_MI_NAd: std_logic; v_proxCPd: tam_dat_camino;
 							ciclod:integer; fichero: in string) is

file S: text;
variable l : line;
variable linea_S : line;

begin
		write(l, ciclod, right, 5);
		hwrite(l, v_cp2d, right, 10);
		hwrite(l, v_instrucd, right, 10);
		impri_instruc_ascii(v_instrucd, l);
		write(l, v_fmtSd, right, 8);
		write (l, v_MSId, right, 2);
		write (l, v_PBRd, right, 2);
		write (l, v_fmtDd, right, 3);
		write (l, v_mL1d, right, 3); 
		write (l, v_mL2d, right, 2);
		write (l, v_mESd, right, 3);
		write (l, v_opALUd, right, 7);
		write (l, v_opMDd, right, 6);
		write (l, v_opSECd, right, 5);	

		write (l, v_mSICd, right, 6);	

		write (l, v_CoErrd, right, 8);	
		write (l, v_MD_FRd, right, 6);	
		write (l, v_MD_NAd, right, 6);	
		hwrite (l, v_dir_MDd, right, 10);	
		write (l, v_MI_FRd, right, 10);	
		write (l, v_MI_NAd, right, 6);	
		hwrite (l, v_proxCPd, right, 10);	

		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
end procedure impri_traza_instruc;


end package body impri_traza_pkg;

