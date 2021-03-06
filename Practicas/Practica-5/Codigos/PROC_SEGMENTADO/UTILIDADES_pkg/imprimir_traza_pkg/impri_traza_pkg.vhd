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
procedure impri_traza_instruc (v_cp1: tipo_direc_inst; v_instruc_B: tam_dat_camino_MI; v_instruc_DL: tam_dat_camino_MI; RS_D, RS_A, RS_M, RS_F, RS_E, RS_8,
								RID: std_logic;
								v_opALU_A: st_opALU; v_opMD_A, v_opMD_M, v_opMD_6, opMD_E: st_opMD; v_opSEC_A: st_opSEC; v_PBR_A, v_PBR_M, v_PBR_6, PBR_E: std_logic;
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
		write (l, string'(" salida de comprobacion de la instruccion que hay en un ciclo en cada etapa"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("ciclo"), right, 5);
		write (l, string'("CP, dir"), right, 9);
		write (l, string'("BUS, I. hex"), right, 13);
		write (l, string'("DL, I. ascii"), right, 15);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("ETAPAS: DL, ALU, M, FMTL, ES"), right, 79);
		write (l, string'("RIESGOS"), right, 16);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("DL  "), right, 55);
		write (l, string'("ALU"), right, 5);
		write (l, string'("M  "), right, 6);
		write (l, string'("FMTL"), right, 7);
		write (l, string'("ES   "), right, 7);
		write (l, string'("R.DATOS"), right, 11);

		write (l, string'("R.SECUENCIAMIENTO"), right, 18);


		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
end procedure cabecera_traza;  



procedure impri_traza_instruc (v_cp1: tipo_direc_inst; v_instruc_B: tam_dat_camino_MI; v_instruc_DL: tam_dat_camino_MI; RS_D, RS_A, RS_M, RS_F, RS_E, RS_8, 
								RID: std_logic;
								v_opALU_A: st_opALU; v_opMD_A, v_opMD_M, v_opMD_6, opMD_E: st_opMD; v_opSEC_A: st_opSEC; v_PBR_A, v_PBR_M, v_PBR_6, PBR_E: std_logic;
 							ciclod:integer; fichero: in string) is
file S: text;
variable l : line;
variable linea_S : line;

begin
		write(l, ciclod, right, 5);
-- CP
		hwrite(l, v_cp1, right, 10);
-- BUS
		hwrite(l, v_instruc_B, right, 10);
-- DL
		impri_instruc_ascii(v_instruc_DL, l);

		if RID = '1' then
			write (l, string'("| DLB"), right, 6);
		elsif RS_A = '1' then
			write (l, string'("| DLN"), right, 6);
		else
			write (l, string'("| DL "), right, 6);
		end if;

-- A
		if (v_opALU_A(num_optALU-1) = '1') or (v_opMD_A(num_opMD-1) = '1') or (v_opSEC_A(num_opSEC-1) = '1') then
			if RS_M = '1' then
				write (l, string'("| AN "), right, 6);
			else
				write (l, string'("| A  "), right, 6);
			end if;
		else

			if v_PBR_A = '0' then
				write (l, string'("| nop"), right, 6);
			else
				write (l, string'("| ERR"), right, 6);
			end if;
		end if;
-- M
		if v_opMD_M(num_opMD-1) = '1' then
			write (l, string'("| M  "), right, 6);
		elsif v_PBR_M = '1' then 
			if RS_F = '1' then
				write (l, string'("| RN "), right, 6);
			else
				write (l, string'("| R  "), right, 6);
			end if;
		else
			if RS_M = '1' then 
				write (l, string'("| -  "), right, 6);
			else
				write (l, string'("| nop"), right, 6);
			end if;
		end if;

--F
		if v_opMD_6(num_opMD-1) = '1' then
			if v_opMD_6(num_opMD-2) = '0' then
				write (l, string'("| F  "), right, 6);
			else
				write (l, string'("| -  "), right, 6);
			end if;
		elsif v_PBR_6 = '1' then 
			if RS_E = '1' then
			 	write (l, string'("| RN "), right, 6);
			else
				write (l, string'("| R  "), right, 6);
			end if;
		else
			if RS_F = '1' then 
				write (l, string'("| -  "), right, 6);
			else
				write (l, string'("| nop"), right, 6);
			end if;
		end if;

-- E
		if opMD_E(num_opMD-1) = '1' then
			if opMD_E(num_opMD-2) = '0' then
				write (l, string'("| E  "), right, 6);
			else
				write (l, string'("| -  "), right, 6);
			end if;
		elsif PBR_E = '1' then 
			if RS_8 = '1' then
				write (l, string'("| EN "), right, 6);
			else
				write (l, string'("| E  "), right, 6);
			end if;
		else
			if RS_E = '1' then
				write (l, string'("| -  "), right, 6);
			else
				write (l, string'("| nop"), right, 6);
			end if;
		end if;



		write (l, string'("RD: "), right, 10);
		write (l, RID, right, 2);
		write (l, string'("RS: "), right, 6);
		write (l, RS_D, right, 2);

		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

end procedure impri_traza_instruc;


end package body impri_traza_pkg;

