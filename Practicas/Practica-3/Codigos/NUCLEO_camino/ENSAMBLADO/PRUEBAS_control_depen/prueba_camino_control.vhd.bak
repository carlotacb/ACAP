--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.prueba_procedimientos_camino_control_pkg.all;
use work.impri_BR_pkg.all;

use std.env.all;

entity prueba_camino_control is 	
generic (semiperiodo: time:= 25 ns;
		imprimir_BR: boolean:= true;
		pasoapaso: boolean:= false);	
end prueba_camino_control;		

architecture prueba of prueba_camino_control is		

component camino_control is     
port(reloj: in std_logic;
	PEini, Pcero, ini: in std_logic;
	IDEini:in st_iden; 
	DEini: in st_datos; 
	IDL1ini:in st_iden; 
	finalop: out std_logic);
end component;


procedure comprobar_reg_modificado(primerreg: in integer; ultimoreg: in integer; reg_resul: in integer; signal reloj: in std_logic; signal IDL1ini: out st_iden; signal LE1: in st_datos) is
variable leido: st_datos;
variable calculo: integer;
begin
	calculo := 0;
	leer_reg (primerreg, reloj, IDL1ini, LE1, leido);
	calculo := calculo + to_integer(unsigned(leido)) * 2;
	for i in primerreg+1 to ultimoreg loop    
		leer_reg (i, reloj, IDL1ini, LE1, leido);
		calculo := calculo + to_integer(unsigned(leido));
	end loop;
	comprobar_reg(reg_resul, reloj, IDL1ini, LE1, calculo);
end procedure;

signal reloj, Pcero, PEini, ini: std_logic;
signal IDE, IDEini: st_iden;
signal DEini: st_datos;
signal IDL1ini, IDL2: st_iden;

signal LE1: st_datos;
signal finalop: std_logic;

signal finaltraza: std_logic:= '0';
shared variable final : boolean := false;
signal cntciclos: integer := 0;

constant fichero: string := "../../../RESULTADOS_control_indepe/resultados.txt";

begin		

camino_cnt: camino_control port map(reloj => reloj, PEini => PEini, Pcero => Pcero, ini => ini, IDEini => IDEini, DEini => DEini, IDL1ini => IDL1ini, finalop => finalop); 

	LE1 <= << signal camino_cnt.Le1: std_logic_vector >>;

estimulos: Process 
variable prueba, op1, op2: st_datos;
variable calculo: integer;
variable primerreg, ultimoreg: integer;
variable reg_oper1, reg_oper2, reg_resul: integer;
 begin 
	report "Puesta a cero";
	puesta_cero(reloj, Pcero, PEini, DEini, IDEini, IDL1ini, ini);

	report CR &LF & "Inicializacion del banco de registros. Ciclo: " & integer'image(cntciclos);
	ini_BR(reloj, PEini, DEini, IDEini);

	report CR &LF & "Inicio de la operacion. Ciclo: " & integer'image(cntciclos);
	operacion(reloj, ini, finalop);

	report CR &LF & "Inicio de la comprobacion de los registros no modificados. Ciclo: " & integer'image(cntciclos);
	primerreg:= 0;
	ultimoreg:= 9;
	for i in primerreg to ultimoreg loop    
		comprobar_reg(i, reloj, IDL1ini, LE1, i);
	end loop;

	primerreg:= 11;
	ultimoreg:= 31;
	for i in primerreg to ultimoreg loop    
		comprobar_reg(i, reloj, IDL1ini, LE1, i);
	end loop;

	report CR &LF & "Inicio de la comprobacion de los registros modificados. Ciclo: " & integer'image(cntciclos);

	primerreg:= 0;
	ultimoreg:= 8;
	reg_resul:= 10;
	comprobar_reg_modificado(primerreg, ultimoreg, reg_resul, reloj, IDL1ini, LE1);

	wait until rising_edge(reloj); 
	wait until rising_edge(reloj); 
	wait until rising_edge(reloj); 

	finaltraza <= '1';
	wait;
end process;


finalizar: process 
alias B_registros is << signal .prueba_camino_control.camino_cnt.bancoregistro.mem: ramtype >>;
begin
	wait until finaltraza = '1';
	final := true;
	if imprimir_BR then
		impri_BR(B_registros, fichero);
	end if;
end process;

preloj: process
begin
  if final = false then
    reloj <= '0';
    wait for semiperiodo;
    reloj <= '1';
	cntciclos <= cntciclos + 1;
    wait for semiperiodo;
	if pasoapaso then
		stop(0);
	end if;
	else
	  wait;
	end if;
end process;
 
 
end prueba;		

