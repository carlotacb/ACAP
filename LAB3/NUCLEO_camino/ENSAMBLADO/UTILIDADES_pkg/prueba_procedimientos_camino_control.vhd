--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;

package prueba_procedimientos_camino_control_pkg is
procedure puesta_cero(signal reloj: in std_logic; signal Pcero: out std_logic; signal PEini: out std_logic; signal DEini: out st_datos; signal IDEini: out st_iden; signal IDL1ini: out st_iden; signal ini: out std_logic);

procedure ini_BR(signal reloj: in std_logic; signal PEini: out std_logic; signal DEini: out st_datos; signal IDEini: out st_iden);

procedure operacion(signal reloj: in std_logic; signal ini: out std_logic; signal finalop: in std_logic);

procedure leer_reg (num_registro: in integer; signal reloj: in std_logic; signal IDL1ini: out st_iden; signal LE1: in st_datos; variable leido: out st_datos);

procedure comprobar_reg (num_registro: in integer; signal reloj: in std_logic; signal IDL1ini: out st_iden; signal LE1: in st_datos; valor: in integer);

end package prueba_procedimientos_camino_control_pkg;

package body prueba_procedimientos_camino_control_pkg is

procedure puesta_cero(signal reloj: in std_logic; signal Pcero: out std_logic; signal PEini: out std_logic; signal DEini: out st_datos; signal IDEini: out st_iden; signal IDL1ini: out st_iden; signal ini: out std_logic) is
begin
	PEini <= '0';
	DEini <= (others => '0');
	IDEini <= (others => '0');
	IDL1ini <= (others => '0');
	ini<= '0';
	Pcero <= '1';
	wait until rising_edge(reloj); 
	wait until rising_edge(reloj); 
	Pcero <= '0';
	wait until rising_edge(reloj); 
end procedure;

procedure ini_BR(signal reloj: in std_logic; signal PEini: out std_logic; signal DEini: out st_datos; signal IDEini: out st_iden) is 
begin
	PEini <= '1';
	for i in 0 to num_reg-1 loop   
		IDEini <= std_logic_vector(to_unsigned(i, IDEini'length));
  		DEini <= std_logic_vector(to_unsigned(i, DEini'length));
		wait until rising_edge(reloj); 
	end loop;
	PEini <= '0';
end procedure;

procedure operacion(signal reloj : in std_logic; signal ini : out std_logic; signal finalop : in std_logic) is
begin
	wait until falling_edge(reloj);
	ini <= '1';
	wait until falling_edge(reloj);
	ini <= '0';
	wait until rising_edge(reloj) and finalop = '1';
end procedure;

procedure leer_reg (num_registro: in integer; signal reloj: in std_logic; signal IDL1ini: out st_iden; signal LE1: in st_datos; variable leido: out st_datos) is
begin
	IDL1ini <= std_logic_vector(to_unsigned(num_registro, IDL1ini'length)) after 2 ns;
	wait until rising_edge(reloj); 
	leido:= LE1;
end procedure;

procedure comprobar_reg (num_registro: in integer; signal reloj: in std_logic; signal IDL1ini: out st_iden; signal LE1: in st_datos; valor: in integer) is
variable leido: st_datos;
begin
	leer_reg (num_registro, reloj, IDL1ini, LE1, leido);
	assert to_integer(unsigned(leido)) = valor report "error igualdad  " & integer'image(num_registro) & "  esperado  " & integer'image(valor) & "   leido  " & integer'image(to_integer(unsigned(leido)));
end procedure;

end package body prueba_procedimientos_camino_control_pkg;
	

