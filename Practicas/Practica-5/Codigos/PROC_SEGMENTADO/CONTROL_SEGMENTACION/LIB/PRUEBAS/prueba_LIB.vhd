--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;
use ieee.std_logic_textio.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.codificar_instrucciones_pkg.all;
use work.deco_inst_impri_pkg.all;

entity prueba_LIB is 
end prueba_LIB;

architecture comportamiento of prueba_LIB is

component LIB is		-- modul a comprovar
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

component LIB_v is		-- modul de REFERENCIA
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

constant n: positive := 32;
type t_vec_inst is array (1 to n) of tipo_inst_busq;

signal reloj, pcero: std_logic;
signal ciclo: integer:= 0;

signal instruc: tipo_inst_busq;
signal fmtS : st_fmtS;
signal MSI : st_mSI;

-- sortides modul a comprovar
signal bloqCP, bloqBDL, inyecBDL, inyecDLA: std_logic; 

-- sortides modul de REFERENCIA
signal bloqCP_ok, bloqBDL_ok, inyecBDL_ok, inyecDLA_ok: std_logic; 

-- instruccions en les etapes
signal instrucB, instrucDL, instrucA, instrucM, instrucF, instrucE: tipo_inst_busq;

shared variable final: boolean := false;

file S: text;
constant fichero: string := "../../../RESULTADOS/resultados_LIB.txt";

constant nop: tipo_inst_busq := cod_tipo_RI(ADDI_I, std_logic_vector(to_unsigned(0, 12)), 0, 0);
constant ebreak: tipo_inst_busq := x"00100073";

subtype t_vLDD is  std_logic_vector(1 to 4);
type t_mLDD is array (1 to 2) of t_vLDD;
subtype t_RDRS is std_logic_vector(1 to 2);		-- 1: RD, 2: RS
subtype t_LGR is std_logic_vector(1 to 4);		-- 1: bCP, 2: bBDL, 3: iBDL, 4: iDLA

-- comprovacio LIB
procedure comprova_LIB (LDD: in t_mLDD; LDD_ok: inout t_mLDD; RDS, RDS_ok: in t_RDRS; LGR, LGR_ok: in t_LGR; err: out boolean) is
variable anula: std_logic_vector(1 to 2);
variable LDD_in: t_mLDD := LDD;
begin
	err := false;
	for i in 1 to 2 loop
		anula(i) := LDD_ok(i)(1);
		for j in 2 to 4 loop
			if anula(i) = '1' then
				LDD_ok(i)(j) := 'X';
				LDD_in(i)(j) := 'X';
			else
				anula(i) := LDD_ok(i)(j);
			end if;
		end loop;
	end loop;
	if (LDD_in /= LDD_ok) or (RDS /= RDS_ok) or (LGR /= LGR_ok) then
		err := true;
	end if;
end procedure comprova_LIB;

-- inicialitzacio sequencia d'instruccions
procedure ini_seq (inst: inout t_vec_inst) is
begin
	for i in inst'range loop
		inst(i) := ebreak;
	end loop;
-- dependencies distancies 1, 2, 3, 4 L1
	inst(1) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(2) := cod_tipo_R(ADD_R, 3, 10, 11); -- add x11, x3, x10
-- dependencies distancies 1, 2, 3, 4 L2
	inst(3) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(4) := cod_tipo_R(ADD_R, 10, 3, 11); -- add x11, x10, x3
-- dependencies distancies 1, 2, 3, 4 L1 x0
	inst(5) := cod_tipo_R(ADD_R, 1, 2, 0); -- add x0, x1, x2
	inst(6) := cod_tipo_R(ADD_R, 0, 10, 0); -- add x0, x0, x10
	inst(7) := cod_tipo_R(ADD_R, 0, 10, 0); -- add x0, x0, x10
	inst(8) := cod_tipo_R(ADD_R, 0, 10, 0); -- add x0, x0, x10
	inst(9) := cod_tipo_R(ADD_R, 0, 10, 0); -- add x0, x0, x10
-- dependencies distancies 1, 2, 3, 4 L2 x0
	inst(10) := cod_tipo_R(ADD_R, 1, 2, 0); -- add x0, x1, x2
	inst(11) := cod_tipo_R(ADD_R, 10, 0, 0); -- add x0, x10, x0
	inst(12) := cod_tipo_R(ADD_R, 10, 0, 0); -- add x0, x10, x0
	inst(13) := cod_tipo_R(ADD_R, 10, 0, 0); -- add x0, x10, x0
	inst(14) := cod_tipo_R(ADD_R, 10, 0, 0); -- add x0, x10, x0
-- salt condicional amb dependencies distancies 1, 2, 3, 4 L1
 	inst(15) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(16) := cod_tipo_branch_SB(BEQ_SB, std_logic_vector(to_unsigned(11, 12)), 17, 3); -- beq x17, x3, #11
-- salt condicional amb dependencies distancies 1, 2, 3, 4 L2
 	inst(17) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(18) := cod_tipo_branch_SB(BEQ_SB, std_logic_vector(to_unsigned(11, 12)), 3, 17); -- beq x3, x17, #11
-- jalr amb dependencies a distancia 1
	inst(19) := cod_tipo_load_I(LW_I, std_logic_vector(to_unsigned(0, 12)), 2, 1); -- load x1, 0(x2)
	inst(20) := cod_tipo_jalr_I(JALR_I, std_logic_vector(to_unsigned(0, 12)), 1, 3); -- jalr x3, 0(x1)
	inst(21) := cod_tipo_R(ADD_R, 3, 2, 1); -- add x1, x3, x2
end procedure ini_seq;

begin

logica_LIB: LIB port map (reloj => reloj, pcero => pcero, B => bloqBDL_ok, I => inyecDLA_ok, instruc => instrucB,
						bloqCP => bloqCP , bloqBDL => bloqBDL , inyecBDL => inyecBDL, inyecDLA => inyecDLA);

-- modul de REFERENCIA
ok_LIB: LIB_v port map (reloj => reloj, pcero => pcero, B => bloqBDL_ok, I => inyecDLA_ok, instruc => instrucB,
					bloqCP => bloqCP_ok , bloqBDL => bloqBDL_ok , inyecBDL => inyecBDL_ok, inyecDLA => inyecDLA_ok);


	instrucB <= instruc when inyecBDL_ok='0' else nop;

cadena_instruccions: process (reloj)
begin
	if reloj'event and reloj = '1' then
-- BDL
		if inyecBDL_ok = '1' then
			instrucDL <= nop;
		elsif bloqBDL_ok = '0' then
			instrucDL <= instrucB;
		end if;
-- DLA
		if inyecDLA_ok = '1' then
			instrucA <= nop;
		else
			instrucA <= instrucDL;
		end if;
-- AM MF FE
		instrucM <= instrucA;
		instrucF <= instrucM;
		instrucE <= instrucF;
	end if;
end process;

comprova: process  is
variable l: line;
variable linea_S: line;

alias IDL1A is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL1A: std_logic >>; 
alias IDL2A is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL2A: std_logic >>; 
alias IDL1M is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL1M: std_logic >>; 
alias IDL2M is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL2M: std_logic >>; 
alias IDL1F is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL1F: std_logic >>; 
alias IDL2F is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL2F: std_logic >>; 
alias IDL1E is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL1E: std_logic >>; 
alias IDL2E is << signal .prueba_LIB.logica_LIB.R_dat.LDDat.IDL2E: std_logic >>; 
alias RID is << signal .prueba_lib.logica_LIB.R_dat.R_dat.RD: std_logic >>;
alias RS is << signal .prueba_lib.logica_LIB.R_Sec.R_sec.RS: std_logic >>;

alias IDL1A_ok is << signal .prueba_lib.ok_LIB.R_dat.LDDat.IDL1A: std_logic >>;
alias IDL2A_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL2A: std_logic >>; 
alias IDL1M_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL1M: std_logic >>; 
alias IDL2M_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL2M: std_logic >>; 
alias IDL1F_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL1F: std_logic >>; 
alias IDL2F_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL2F: std_logic >>; 
alias IDL1E_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL1E: std_logic >>; 
alias IDL2E_ok is << signal .prueba_LIB.ok_LIB.R_dat.LDDat.IDL2E: std_logic >>; 
alias RID_ok is << signal .prueba_LIB.ok_LIB.R_dat.R_dat.RD: std_logic >>;
alias RS_ok is << signal .prueba_LIB.ok_LIB.R_Sec.R_sec.RS: std_logic >>;

variable v_RDS, v_RDS_ok: t_RDRS;	-- std_logic_vector(1 to 2);
variable v_LGR, v_LGR_ok: t_LGR;	-- std_logic_vector(1 to 4);
variable v_ciclo: integer;
variable err: boolean;
variable err_LDD: boolean;

variable m_LDD, m_LDD_ok: t_mLDD;

begin

	write (l, string'("Cicle; Dep L1_AMFE L2_AMFE; RD_RS; bCP_bBDL_iBDL_iDLA" & LF));
	write (l, string'("sortides esperades, instruccions DL ALU M F ES" & LF));
	linea_S :=  new string'(l.all);
	writeline (output, l);
	file_open(S,fichero,write_mode); 
	writeline (S, linea_S);
	file_close(S);

espera: 
	loop
		wait until reloj'event and reloj ='1';
		if ciclo > 2 then
			v_ciclo := ciclo'delayed(0 ps);
			v_RDS := RID & RS;
			v_LGR := bloqCP & bloqBDL & inyecBDL & inyecDLA;
			v_RDS_ok := RID_ok & RS_ok;
			v_LGR_ok := bloqCP_ok & bloqBDL_ok & inyecBDL_ok & inyecDLA_ok;

			m_LDD := (1 => (IDL1A, IDL1M, IDL1F, IDL1E), 2 => (IDL2A, IDL2M, IDL2F, IDL2E));
			m_LDD_ok := (1 => (IDL1A_ok, IDL1M_ok, IDL1F_ok, IDL1E_ok), 2 => (IDL2A_ok, IDL2M_ok, IDL2F_ok, IDL2E_ok));

			comprova_LIB (m_LDD, m_LDD_ok, v_RDS, v_RDS_ok, v_LGR, v_LGR_ok, err);

			write (l, v_ciclo, left, 4);
			write (l, m_LDD(1), left, 5);
			write (l, m_LDD(2), left, 5);
			write (l, v_RDS, left, 3);
			write (l, v_LGR, left, 5);

			impri_instruc_ascii(instrucDL, l);
			impri_instruc_ascii(instrucA, l);
			impri_instruc_ascii(instrucM, l);
			impri_instruc_ascii(instrucF, l);
			impri_instruc_ascii(instrucE, l);
			linea_S := new string'(l.all);
			writeline(output, l);
			file_open(S,fichero,append_mode); 
			writeline (S, linea_S);
			file_close(S);

			write (l, string'("esp"), left, 4);
			write (l, m_LDD_ok(1), left, 5);
			write (l, m_LDD_ok(2), left, 5);
			write (l, v_RDS_ok, left, 3);
			write (l, v_LGR_ok, left, 5);
			linea_S := new string'(l.all);
			writeline(output, l);
			file_open(S,fichero,append_mode); 
			writeline (S, linea_S);
			file_close(S);

			if err then
				write (l, string'(" error LIB"));
				linea_S := new string'(l.all);
				writeline(output, l);
				file_open(S,fichero,append_mode); 
				writeline (S, linea_S);
				file_close(S);
			end if;
			writeline(output, l);
			file_open(S,fichero,append_mode); 
			writeline (S, linea_S);
			file_close(S);
		end if;
		assert not(err);

	end loop;

end process comprova;

estimulos: process is
variable inst: t_vec_inst;
variable i: natural;

begin
	ini_seq (inst);

	pcero <= '1';
	instruc <= nop;

	wait until reloj'event and reloj='1';
	i := 1;
	instruc <= inst(i);
	wait until reloj'event and reloj='0';
	pcero <= '0';

	loop
		wait until reloj'event and reloj='1'; 
		if (bloqBDL_ok='0' and inyecBDL_ok='0') then
			i := i + 1;
			instruc <= inst(i);
		end if;			
		exit when instrucE = ebreak;
	end loop;

	final := true;
	wait;
        
end process;

-- rellotge
process
begin
  if final = false then
    reloj <= '0';
    wait for 40 ns;
    reloj <= '1';
 	ciclo <= ciclo + 1;
   wait for 40 ns;
	else
	  wait;
	end if;
end process;


end;

