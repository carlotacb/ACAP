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

entity prueba_LIB_C is 
end prueba_LIB_C;

architecture comportamiento of prueba_LIB_C is

component LIB_C is			-- modul a comprovar
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

component LIB_C_v is		-- modul de REFERENCIA
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

constant n: positive := 64;
type t_vec_inst is array (1 to n) of tipo_inst_busq;

signal reloj, pcero, B, I: std_logic;
signal ciclo: integer:= 0;

signal instruc: tipo_inst_busq;
signal fmtS : st_fmtS;
signal MSI : st_mSI;

signal PBR: st_PBR;
signal opSEC: st_opSEC;

-- sortides modul a comprovar
signal bloqCP, bloqBDL, inyecBDL, inyecDLA: std_logic; 
signal C1L1, C2L1, C3L1, C4L1: std_logic;
signal C1L2, C2L2, C3L2, C4L2: std_logic;

-- sortides modul de REFERENCIA
signal bloqCP_ok, bloqBDL_ok, inyecBDL_ok, inyecDLA_ok: std_logic; 
signal C1L1_ok, C2L1_ok, C3L1_ok, C4L1_ok: std_logic;
signal C1L2_ok, C2L2_ok, C3L2_ok, C4L2_ok: std_logic;

signal instrucB, instrucDL, instrucA, instrucM, instrucF, instrucE: tipo_inst_busq;

shared variable final: boolean := false;

file S: text;
constant fichero: string := "../../../RESULTADOS/resultados_LIB_C.txt";

constant nop: tipo_inst_busq := cod_tipo_RI(ADDI_I, std_logic_vector(to_unsigned(0, 12)), 0, 0);
constant ebreak: tipo_inst_busq := x"00100073";

subtype t_vLDD is  std_logic_vector(1 to 4);	-- A M F E
type t_mLDD is array (1 to 2) of t_vLDD;		-- L1 L2
subtype t_RDRS is std_logic_vector(1 to 2);		-- 1: RD, 2: RS
subtype t_LGR is std_logic_vector(1 to 4);		-- 1: bCP, 2: bBDL, 3: iBDL, 4: iDLA
subtype t_latph is std_logic_vector(1 to 2);	-- A M

-- inicialitzacio sequencia d'instruccions
procedure ini_seq (inst: inout t_vec_inst) is
begin
	for i in inst'range loop
		inst(i) := ebreak;
	end loop;
-- curtcircuits CL1_1234 CL2_1234 lat_prod = 1
	inst(1) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(2) := cod_tipo_R(ADD_R, 3, 3, 11); -- add x11, x3, x3
	inst(3) := cod_tipo_R(ADD_R, 3, 3, 12); -- add x12, x3, x3
	inst(4) := cod_tipo_R(ADD_R, 3, 3, 13); -- add x13, x3, x3
	inst(5) := cod_tipo_R(ADD_R, 3, 3, 14); -- add x14, x3, x3
	inst(6) := cod_tipo_R(ADD_R, 3, 3, 15); -- add x15, x3, x3
-- curtcircuits CL1_1234 CL2_1234 lat_prod = 3
	inst(7) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 1, 3); -- lw x3, -4(x1)
	inst(8) := cod_tipo_R(ADD_R, 3, 3, 11); -- add x11, x3, x3
	inst(9) := cod_tipo_R(ADD_R, 3, 3, 12); -- add x12, x3, x3
	inst(10) := cod_tipo_R(ADD_R, 3, 3, 13); -- add x13, x3, x3
	inst(11) := cod_tipo_R(ADD_R, 3, 3, 14); -- add x14, x3, x3
	inst(12) := cod_tipo_R(ADD_R, 3, 3, 15); -- add x15, x3, x3
-- curtcircuits CL1_1234 lat_prod = 1 cadena de dependencies
	inst(13) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(14) := cod_tipo_R(ADD_R, 3, 4, 3); -- add x3, x3, x4
	inst(15) := cod_tipo_R(ADD_R, 3, 4, 3); -- add x3, x3, x4
	inst(16) := cod_tipo_R(ADD_R, 3, 4, 3); -- add x3, x3, x4
	inst(17) := cod_tipo_R(ADD_R, 3, 4, 3); -- add x3, x3, x4
	inst(18) := cod_tipo_R(ADD_R, 3, 4, 3); -- add x3, x3, x4
-- curtcircuits CL1_1234 lat_prod = 3 cadena de dependencies
	inst(19) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 1, 3); -- lw x3, -4(x1)
	inst(20) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 3, 3); -- lw x3, -4(x3)
	inst(21) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 3, 3); -- lw x3, -4(x3)
	inst(22) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 3, 3); -- lw x3, -4(x3)
	inst(23) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 3, 3); -- lw x3, -4(x3)
	inst(24) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 3, 3); -- lw x3, -4(x3)
-- falsa dependencia
	inst(25) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(-4, 12)), 1, 3); -- lw x3, -4(x1)
	inst(26) := cod_tipo_R(ADD_R, 1, 2, 3); -- add x3, x1, x2
	inst(27) := cod_tipo_R(ADD_R, 3, 2, 4); -- add x4, x3, x2
	inst(28) := cod_tipo_R(ADD_R, 3, 2, 5); -- add x5, x3, x2
	inst(29) := cod_tipo_R(ADD_R, 3, 2, 6); -- add x6, x3, x2
	inst(30) := cod_tipo_R(ADD_R, 3, 2, 7); -- add x7, x3, x2
--sequencia add jalr add dependents
	inst(31) := cod_tipo_R(ADD_R, 1, 2, 6); -- add x6, x1, x2
	inst(32) := cod_tipo_jalr_I(JALR_I,std_logic_vector(to_signed(-256, 12)), 6, 7); -- jalr x7, -256(x6)
	inst(33) := cod_tipo_R(ADD_R, 7, 6, 3); -- add x3, x7, x6
--sequencia load jalr add dependents
	inst(34) := cod_tipo_load_I(LW_I, std_logic_vector(to_signed(0, 12)), 1, 6); -- lw x6, 0(x1)
	inst(35) := cod_tipo_jalr_I(JALR_I,std_logic_vector(to_signed(-256, 12)), 6, 7); -- jalr x7, -256(x6)
	inst(36) := cod_tipo_R(ADD_R, 7, 6, 3); -- add x3, x7, x6
	
end procedure ini_seq;

begin

logica_LIB: LIB_C port map (reloj => reloj, pcero => pcero, B => bloqBDL_ok, I => inyecDLA_ok, instruc => instrucB,
					C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1,
					C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2,
					bloqCP => bloqCP , bloqBDL => bloqBDL , inyecBDL => inyecBDL, inyecDLA => inyecDLA);

-- modul de REFERENCIA
ok_LIB: LIB_C_v port map (reloj => reloj, pcero => pcero, B => bloqBDL_ok, I => inyecDLA_ok, instruc => instrucB,
					C1L1 => C1L1_ok, C2L1 => C2L1_ok, C3L1 => C3L1_ok, C4L1 => C4L1_ok,
					C1L2 => C1L2_ok, C2L2 => C2L2_ok, C3L2 => C3L2_ok, C4L2 => C4L2_ok,
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

alias IDL1A is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL1A: std_logic >>; 
alias IDL2A is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL2A: std_logic >>; 
alias IDL1M is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL1M: std_logic >>; 
alias IDL2M is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL2M: std_logic >>; 
alias IDL1F is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL1F: std_logic >>; 
alias IDL2F is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL2F: std_logic >>; 
alias IDL1E is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL1E: std_logic >>; 
alias IDL2E is << signal .prueba_LIB_C.logica_LIB.R_dat.LDDat.IDL2E: std_logic >>; 
alias RID is << signal .prueba_LIB_C.logica_LIB.R_dat.R_dat.RD: std_logic >>;
alias RS is << signal .prueba_LIB_C.logica_LIB.R_Sec.R_sec.RS: std_logic >>;
alias latphA is << signal .prueba_lib_c.logica_LIB.R_dat.pos_laph.latphA: std_logic >>; 
alias latphM is << signal .prueba_lib_c.logica_LIB.R_dat.pos_laph.latphM: std_logic >>; 

alias IDL1A_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL1A: std_logic >>;
alias IDL2A_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL2A: std_logic >>; 
alias IDL1M_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL1M: std_logic >>; 
alias IDL2M_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL2M: std_logic >>; 
alias IDL1F_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL1F: std_logic >>; 
alias IDL2F_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL2F: std_logic >>; 
alias IDL1E_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL1E: std_logic >>; 
alias IDL2E_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.LDDat.IDL2E: std_logic >>; 
alias RID_ok is << signal .prueba_LIB_C.ok_LIB.R_dat.R_dat.RD: std_logic >>;
alias RS_ok is << signal .prueba_LIB_C.ok_LIB.R_Sec.R_sec.RS: std_logic >>;
alias latphA_ok is << signal .prueba_lib_c.ok_LIB.R_dat.pos_laph.latphA: std_logic >>; 
alias latphM_ok is << signal .prueba_lib_c.ok_LIB.R_dat.pos_laph.latphM: std_logic >>; 
 
variable v_RDS, v_RDS_ok: t_RDRS;
variable v_LGR, v_LGR_ok: t_LGR;
variable v_latph, v_latph_ok: t_latph;
variable v_ciclo: integer;
variable err: boolean;

variable m_LDD, m_LDD_ok: t_mLDD;
variable m_CL, m_CL_ok: t_mLDD;

begin

	write (l, string'("Cicle; Dep L1_AMFE L2_AMFE; Curts L1_1234 L2_1234; latphA_M; RD_RS; bCP_bBDL_iBDL_iDLA" & LF));
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
			v_latph := latphA & latphM;
			m_LDD := (1 => (IDL1A, IDL1M, IDL1F, IDL1E), 2 => (IDL2A, IDL2M, IDL2F, IDL2E));
			m_CL:= (1 => (C1L1, C2L1, C3L1, C4L1), 2 => (C1L2, C2L2, C3L2, C4L2));

			v_RDS_ok := RID_ok & RS_ok;
			v_LGR_ok := bloqCP_ok & bloqBDL_ok & inyecBDL_ok & inyecDLA_ok;
			v_latph_ok := latphA_ok & latphM_ok;
			m_LDD_ok := (1 => (IDL1A_ok, IDL1M_ok, IDL1F_ok, IDL1E_ok), 2 => (IDL2A_ok, IDL2M_ok, IDL2F_ok, IDL2E_ok));
			m_CL_ok := (1 => (C1L1_ok, C2L1_ok, C3L1_ok, C4L1_ok), 2 => (C1L2_ok, C2L2_ok, C3L2_ok, C4L2_ok));

			write (l, v_ciclo, left, 4);
			write (l, m_LDD(1), left, 5);
			write (l, m_LDD(2), left, 5);
			write (l, m_CL(1), left, 5);
			write (l, m_CL(2), left, 5);
			write (l, v_latph, left, 3);
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
			write (l, m_CL_ok(1), left, 5);
			write (l, m_CL_ok(2), left, 5);
			write (l, v_latph_ok, left, 3);
			write (l, v_RDS_ok, left, 3);
			write (l, v_LGR_ok, left, 5);
			linea_S := new string'(l.all);
			writeline(output, l);
			file_open(S,fichero,append_mode); 
			writeline (S, linea_S);
			file_close(S);

-- comprovacio sortides
			err := false;
			if m_LDD /= m_LDD_ok then
				write (l, string'(" error LDD"));
				err := true;
			end if;
			if m_CL /= m_CL_ok then
				write (l, string'(" error LDC"));
				err := true;
			end if;
			if v_RDS(1)/=v_RDS_ok(1) then
				write (l, string'(" error LDRD"));
				err := true;
			end if;
			if v_latph/=v_latph_ok then
				write (l, string'(" error LATPROH"));
				err := true;
			end if;
			if v_RDS(2)/=v_RDS_ok(2) then
				write (l, string'(" error LDRS"));
				err := true;
			end if;
			if v_LGR/=v_LGR_ok then
				write (l, string'(" error LGR"));
				err := true;
			end if;
			if err then
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

	end loop;

end process comprova;

estimulos: process is
variable inst: t_vec_inst;
variable i: natural;
variable inyecBDL_ant: std_logic:= '0';

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

process
begin
  if final = false then
    reloj <= '0';
    wait for 40 ns;
	ciclo <= ciclo +1;
    reloj <= '1';
    wait for 40 ns;
	else
	  wait;
	end if;
end process;


end;

