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

use work.param_disenyo_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;
use work.deco_inst_impri_pkg.all;

package impri_memoria_I_pkg is
procedure cabecera_memoria_I(fichero: in string);
procedure imprimir(i:in integer; datoLeido: in tam_dat_camino_MI; fichero: in string);
procedure imprimir_puntos(fichero: in string);
procedure impri_memoria_I(mem_datos: in t_ramI; fichero: in string);

end package impri_memoria_I_pkg;

package body impri_memoria_I_pkg is

procedure cabecera_memoria_I(fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
	file_open(S,fichero,append_mode); 
	write (linea_S, string'(LF & CR & " Contenido de la memoria de instrucciones. MI" & LF & CR)); 
	writeline (S, linea_S);
	file_close(S);

	write (l, string'(LF & CR & " Contenido de la memoria de instrucciones. MI" & LF & CR));
	writeline(output, l);

	write (l, string'("dir/16  hexadecimal"& LF));
	write (l, string'("(dir mod 16)/4  binario"& LF), right, 33);
	write (l, string'("dir mod 4  binario"& LF), right, 31);
	write (l, string'("contenido  hexadecimal"& LF), right, 49);

	write (l, string'(" 31 : 4"), right, 7);
	write (l, string'("3:2"), right, 4);
	write (l, string'("1:0"), right, 8);

	write (l, string'(" 31:24"), right, 10);
	write (l, string'(". . "), right,6);
	write (l, string'("7:0"), right, 3);

	write (l, string'("bits de direction y contenido"), right, 32);

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure cabecera_memoria_I;


procedure imprimir(i:in integer; datoLeido: in tam_dat_camino_MI; fichero: in string)is
variable dirmod4: integer;
variable dirdiv4: integer;
file S: text;
variable linea_S : line;
variable l : line;
begin
	dirmod4:= i mod 4;
	dirdiv4:= i /4;
	hwrite(l, std_logic_vector(to_unsigned(dirdiv4,28)), right, 8);
	bwrite(l, std_logic_vector(to_unsigned(dirmod4,2)), right, 3);
	write(l, string'("11 10 01 00"), right, 12);
	hwrite(l, datoLeido(31 downto 24), right, 5);
	hwrite(l, datoLeido(23 downto 16), right, 3);
	hwrite(l, datoLeido(15 downto 8), right, 3);
	hwrite(l, datoLeido(7 downto 0), right, 3);

	impri_instruc_ascii(datoLeido, l);

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir;

procedure imprimir_puntos(fichero: in string)is
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
end procedure imprimir_puntos;

procedure impri_memoria_I(mem_datos: in t_ramI; fichero: in string) is

variable datoLeido_local : contenedor_I;
variable datoLeido, previo_datoLeido: tam_dat_camino_MI;
variable previo_igual: std_logic;
variable v_imprimir: std_logic;
variable num_iguales:integer;
variable cero: tam_dat_camino_MI:= (others => '0');

begin
	cabecera_memoria_I(fichero);
	previo_igual:= '0';
	v_imprimir:= '1';
	num_iguales:= 0;
	previo_datoLeido:= cero;

	for i in 0 to num_contenedores_Elogico_I-1 loop
		datoLeido_local := mem_datos(i);
		for j in num_bytes_contenedor_I-1 downto 0 loop
			datoLeido(tam_byte*(j+1) - 1 downto tam_byte*j) := datoLeido_local(j);
		end loop;
		if previo_igual = '1' then
			if previo_datoLeido  = datoLeido then
				num_iguales:= num_iguales +1;
			else
				if num_iguales >= 1 then
					imprimir_puntos(fichero);
				end if;
				imprimir(i-1, previo_datoLeido, fichero);
				num_iguales:= 0;
			end if;
		end if;
		if previo_datoLeido  = datoLeido and i /= 0 then
			previo_igual:= '1';
		else
			imprimir(i, datoLeido, fichero);
			previo_igual:= '0';
			previo_datoLeido:= datoLeido;
		end if;	
	end loop;

end procedure impri_memoria_I;

end package body impri_memoria_I_pkg;
