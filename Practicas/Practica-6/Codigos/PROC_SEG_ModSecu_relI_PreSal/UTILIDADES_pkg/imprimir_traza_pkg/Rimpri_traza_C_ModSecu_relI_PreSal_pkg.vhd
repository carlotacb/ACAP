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
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.riscv32_coop_funct_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;
use work.deco_inst_impri_pkg.all;

package Rimpri_traza_C_pkg is
impure function nom_programa (nom_fitxer: string) return string;
procedure cabecera_traza (fichero, programa: in string);
procedure impri_traza_instruc (v_cp1: tipo_direc_inst; v_instruc_B: tam_dat_camino_MI; v_instruc_DL: tam_dat_camino_MI; RS_D, RS_A, RS_M, RS_F, RS_E, RS_8,
								RID: std_logic;
								v_opALU_A: st_opALU; v_opMD_A, v_opMD_M, v_opMD_6, opMD_E: st_opMD; v_opSEC_A: st_opSEC; v_PBR_A, v_PBR_M, v_PBR_6, PBR_E: std_logic;
								v_C1L1, v_C2L1, v_C3L1, v_C4L1, v_C1L2, v_C2L2, v_C3L2, v_C4L2: std_logic; v_mxrelI_A: st_mrelI; v_opSEC_DL: st_opSEC; v_ErPre: std_logic;  v_ErPre_M, v_ErPre_F, v_ErPre_E, v_ErPre_8, v_ErPre_9: std_logic; v_opSEC_M, v_opSEC_F, v_opSEC_E: st_opSEC;
 							ciclod:integer; fichero: in string);
end package Rimpri_traza_C_pkg;

package body Rimpri_traza_C_pkg is

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
		write (l, string'(" Salida de comprobacion de la instruccion que hay en un ciclo en cada etapa"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, CR & LF & string'("Para cada ciclo, en dos filas se representan las etapas y cortocircuitos"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
		write (l, string'("Ademas, se indica la prediccion si es una instruccion de secuenciamiento."));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
		write (l, string'("Tambien se muestra la comprobacion de la prediccion de la instruccion "));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
		write (l, string'("que ocupa la etapa ALU."));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
		write (l, string'("En la 1a fila se representan los cortos. En la 2a fila el ciclo y las etapas") & CR & string'("y los riesgos de datos y secuenciamiento"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
		write (l, string'("Ademas, en la 1a fila se muestra la prediccion y la comprobacion de una prediccion previa"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, CR & LF & string'(" Descripcion de las etapas DL, ALU, M, FMTL y ES"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
		write (l, string'("junto con la descripcion de cortocircuitos fuente y destino"));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("DESTINOS de CORTO:"), right, 50-2);
		write (l, string'("C4L2"), right, 7);
		write (l, string'("C2L2"), right, 8);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("C3L2"), right, 55+1);
		write (l, string'("C1L2"), right, 8);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("C4L1"), right, 55+2+1);
		write (l, string'("C2L1"), right, 8);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("C3L1"), right, 55+2+1+1);
		write (l, string'("C1L1"), right, 8);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("FUENTES de CORTO:"), right, 50-2);
		write (l, string'("C1"), right, 14-1+7);
		write (l, string'("C2"), right, 9-1-1-1);
		write (l, string'("C3"), right, 9-2-4);
		write (l, string'("C4"), right, 9-5);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("Acronimos:"), right, 49);
		write (l, string'("0 / 1"), right, 6+2);
		write (l, string'("0 / 1"), right, 6+2+1);
		write (l, string'("1"), right, 10-2-3-2);
		write (l, string'("2"), right, 6);
		write (l, string'("3"), right, 4-1);
		write (l, string'("4"), right, 4);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("RIESGOS"), right, 80+16+8-5-3);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("ciclo"), right, 5);
		write (l, string'("CP     "), right, 9);
		write (l, string'("BUS       "), right, 13);
		write (l, string'("DL          "), right, 15);
		linea_S := new string'(l.all);

		write (l, string'("| DL  "), right, 13);
		write (l, string'("| ALU"), right, 5+5-3);
		write (l, string'("| M  "), right, 6+5-3);
		write (l, string'("| FMTL"), right, 7);
		write (l, string'("| ES   "), right, 7);
		write (l, string'("R.DATOS"), right, 11);

		write (l, string'("R.SECU"), right, 18-11);

		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("direc."), right, 9+6-2);
		write (l, string'("Inst. hex. "), right, 13+2);
		write (l, string'("ensamblador"), right, 17-2);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
end procedure cabecera_traza;  


procedure impri_traza_instruc (v_cp1: tipo_direc_inst; v_instruc_B: tam_dat_camino_MI; v_instruc_DL: tam_dat_camino_MI; RS_D, RS_A, RS_M, RS_F, RS_E, RS_8, 
								RID: std_logic;
								v_opALU_A: st_opALU; v_opMD_A, v_opMD_M, v_opMD_6, opMD_E: st_opMD; v_opSEC_A: st_opSEC; v_PBR_A, v_PBR_M, v_PBR_6, PBR_E: std_logic;
								v_C1L1, v_C2L1, v_C3L1, v_C4L1, v_C1L2, v_C2L2, v_C3L2, v_C4L2: std_logic; v_mxrelI_A: st_mrelI; v_opSEC_DL: st_opSEC; v_ErPre: std_logic; v_ErPre_M, v_ErPre_F, v_ErPre_E, v_ErPre_8, v_ErPre_9: std_logic; v_opSEC_M, v_opSEC_F, v_opSEC_E: st_opSEC;
 							ciclod:integer; fichero: in string) is
file S: text;
variable l : line;
variable linea_S : line;

begin
		write (l, string'(" "), right, 2);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
-- Cortocircuitos
		write (l, v_C4L2, right, 52);
		write (l, v_C3L2, right, 1);--2
		write (l, v_C4L1, right, 2);--4
		write (l, v_C3L1, right, 1);--2

		write (l, v_C2L2, right, 10-7+4-3);
		write (l, v_C1L2, right, 1);
		write (l, v_C2L1, right, 2);
		write (l, v_C1L1, right, 1);
--M
		if (v_C1L2 = '1') or ( v_C1L1 = '1') then
			write (l, string'("1"), right, 2+1);
		else
			write (l, string'(" "), right, 2+1);
		end if;

--F
		if (v_C2L2 = '1') or (v_C2L1 = '1')  then
			write (l, string'("2"), right, 5+3-2+1);
		else
			write (l, string'(" "), right, 5+3-2+1);
		end if;

		if (v_C3L2 = '1') or ( v_C3L1 = '1') then
			write (l, string'("3"), right, 2);
		else
			write (l, string'(" "), right, 2);
		end if;

--E
		if (v_C4L2 = '1') or (v_C4L1 = '1') then
			write (l, string'("4"), right, 4-2+2);
		else
			write (l, string'(" "), right, 4-2+2);
		end if;

		if (v_opSEC_DL = DECS_IMPLICITO) or (v_opSEC_DL = DECS_INCONDICIONAL) then
			write (l, string'(" "), right, 15);
		else
			write (l, string'("Pre: SA"), right, 15);
		end if;
		if (v_opSEC_A = DECS_IMPLICITO) or (v_opSEC_A = DECS_INCONDICIONAL) then
			write (l, string'(" "), right, 7);
		else
			if v_ErPre = '1' then
				write (l, string'("CPr: E"), right, 7);
			else
				write (l, string'("CPr: C"), right, 7);
			end if;
		end if;

		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);


		write(l, ciclod, right, 5);
-- CP
		hwrite(l, v_cp1, right, 10);
-- BUS
		hwrite(l, v_instruc_B, right, 10);
-- DL
		impri_instruc_ascii(v_instruc_DL, l);

		if RID = '1' then
			write (l, string'("| DLB"), right, 6); 
		elsif RS_A = '1' or v_ErPre_M = '1' then
			write (l, string'("| DLN"), right, 6);
		else
			write (l, string'("| DL "), right, 6);
		end if;

-- A
		if (v_opALU_A(num_optALU-1) = '1') or (v_opMD_A(num_opMD-1) = '1') or (v_opSEC_A(num_opSEC-1) = '1') then
			if RS_M = '1'  or v_ErPre_F = '1' then 
				write (l, string'("| AN "), right, 6+5-3);
			else
				if (v_opSEC_A(num_opSEC-1) = '0') or (v_opSEC_A = DECS_INCONDICIONAL) then 
					write (l, string'("| A  "), right, 6+5-3);
				else 
					write (l, string'("| CPr"), right, 6+5-3);
				end if;
			end if;
		else

			if v_PBR_A = '0' then
				write (l, string'("| nop"), right, 6+5-3);
			else
				if v_mxrelI_A = '1' then
					write (l, string'("| R  "), right, 6+5-3);
				else
					write (l, string'("ERR"), right, 6+5-3);
				end if;
			end if;
		end if;
-- M
		if v_opMD_M(num_opMD-1) = '1' then
			write (l, string'("| M  "), right, 6+9-4-3-1);
		elsif v_PBR_M = '1' then 
			if RS_F = '1'  or v_ErPre_E = '1' then
				write (l, string'("| RN "), right, 6+9-4-3-1);
			else
				write (l, string'("| R  "), right, 6+9-4-3-1);
			end if;
		else
			if RS_M = '1' then 
				write (l, string'("| -  "), right, 6+9-4-3-1);
			else
				if ((v_opSEC_M(num_opSEC-1) = '1') and not (v_opSEC_M = DECS_IMPLICITO or v_opSEC_M = DECS_INCONDICIONAL)) then
					write (l, string'("| -  "), right, 6+9-4-3-1);
				else
					write (l, string'("| nop"), right, 6+9-4-3-1);
				end if;
			end if;
		end if;

--F
		if v_opMD_6(num_opMD-1) = '1' then
			if v_opMD_6(num_opMD-2) = '0' then
				write (l, string'("| F  "), right, 6+1);
			else
				write (l, string'("| -  "), right, 6+1);
			end if;
		elsif v_PBR_6 = '1' then 
			if RS_E = '1'  or v_ErPre_8 = '1' then
			 	write (l, string'("| RN "), right, 6+1);
			else
				write (l, string'("| R  "), right, 6+1);
			end if;
		else
			if RS_F = '1' then 
				write (l, string'("| -  "), right, 6+1);
			else
				if ((v_opSEC_F(num_opSEC-1) = '1') and not (v_opSEC_F = DECS_IMPLICITO or v_opSEC_F = DECS_INCONDICIONAL)) then
					write (l, string'("| -  "), right, 6+1);
				else
					write (l, string'("| nop"), right, 6+1);
				end if;
			end if;
		end if;

-- E
		if opMD_E(num_opMD-1) = '1' then
			if opMD_E(num_opMD-2) = '0' then
				write (l, string'("| E  "), right, 6);
			else
				write (l, string'("-  "), right, 6);
			end if;
		elsif PBR_E = '1' then 
			if RS_8 = '1'  or v_ErPre_9 = '1' then
				write (l, string'("| EN "), right, 6);
			else
				write (l, string'("| E  "), right, 6);
			end if;
		else
			if RS_E = '1' then
				write (l, string'("| -  "), right, 6);
			else
				if ((v_opSEC_E(num_opSEC-1) = '1') and not (v_opSEC_E = DECS_IMPLICITO or v_opSEC_E = DECS_INCONDICIONAL)) then
					write (l, string'("| -  "), right, 6);
				else
					write (l, string'("| nop"), right, 6);
				end if;
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


end package body Rimpri_traza_C_pkg;

