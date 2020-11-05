--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.cte_tipos_nucleo_pkg.all;

package impri_BR_pkg is

procedure cabecera_BR(fichero: in string);
procedure imprimir_BR(i:in integer; datoLeido: in st_datos; fichero: in string);
procedure imprimir_puntos_BR(fichero: in string);
procedure impri_BR(Banco_registros: in ramtype; fichero: in string);

end package impri_BR_pkg;

package body impri_BR_pkg is

procedure cabecera_BR(fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
	file_open(S,fichero,write_mode); 
	write (linea_S, string'(LF & CR & " Contenido del banco de registros. BR")); 
	writeline (S, linea_S);
	file_close(S);

	write (l, string'(LF & CR & " Contenido del banco de registros. BR"));
	writeline(output, l);

	writeline(output, l);
	write (l, string'("Num registro decimal"& LF));
	write (l, string'("contenido  hexadecimal"), right, 28);

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);

	file_close(S);
end procedure cabecera_BR;

procedure imprimir_BR(i:in integer; datoLeido: in st_datos; fichero: in string)is
variable dirmod4: integer;
variable dirdiv4: integer;
file S: text;
variable linea_S : line;
variable l : line;
begin
	write(l, integer'image(i), right, 4);

	hwrite(l, datoLeido(7 downto 0), right, 4);
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir_BR;

procedure imprimir_puntos_BR(fichero: in string)is
file S: text;
variable linea_S : line;
variable l : line;
begin
	write(l, string'(" . . . . . . . . ."));
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir_puntos_BR;

procedure impri_BR(Banco_registros: in ramtype; fichero: in string) is

variable datoLeido, previo_datoLeido: st_datos;
variable previo_igual: std_logic;
variable v_imprimir: std_logic;
variable num_iguales:integer;
variable cero: st_datos:= (others => '0');

begin
	cabecera_BR(fichero);
	previo_igual:= '0';
	v_imprimir:= '1';
	num_iguales:= 0;
	previo_datoLeido:= cero;

	for i in 0 to num_reg-1 loop
		datoLeido := Banco_registros(i);
		if previo_igual = '1' then
			if previo_datoLeido  = datoLeido then
				num_iguales:= num_iguales +1;
			else
				if num_iguales >= 1 then
					imprimir_puntos_BR(fichero);
				end if;
				imprimir_BR(i-1, previo_datoLeido, fichero);
				num_iguales:= 0;
			end if;
		end if;
		if previo_datoLeido  = datoLeido and i /= 0 then
			previo_igual:= '1';
		else
			imprimir_BR(i, datoLeido, fichero);
			previo_igual:= '0';
			previo_datoLeido:= datoLeido;
		end if;	
	end loop;

end procedure impri_BR;


end package body impri_BR_pkg;

