--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.cte_tipos_nucleo_pkg.all;

package procedimientos_pkg is

procedure escritura (signal PE: out std_logic; signal IDE: out st_iden; signal DE: out st_datos;
			direccion: in st_iden; dato: in st_datos);

procedure lectura (signal PE: out std_logic; signal IDL: out st_iden; direccion: in st_iden);

procedure comprobacion_de_lectura (signal LE: in st_datos; direccion: in st_iden; valor: in st_datos);

end package procedimientos_pkg;

package body procedimientos_pkg is

procedure escritura (signal PE: out std_logic; signal IDE: out st_iden; signal DE: out st_datos;
                     direccion: in st_iden; dato: in st_datos) is
variable L: line;
begin
	PE <= '1';
  IDE <= direccion;
  DE <= dato;
	write(L, string'("escritura registro:   "));
	hwrite(L, direccion);
	write(L, string'(", dato:   "));
	hwrite(L, dato);
	writeline(output, L);
end procedure;

procedure lectura (signal PE: out std_logic; signal IDL: out st_iden; direccion: in st_iden) is
begin
	PE <= '0';
	IDL <= direccion;
end procedure;

procedure comprobacion_de_lectura (signal LE: in st_datos; direccion: in st_iden; valor: in st_datos) is
variable L: line;
begin
	write(L, string'("lectura registro:     "));
	hwrite(L, direccion);
	write(L, string'(", dato:   "));
	hwrite(L, LE);
	if (LE /= valor) then 
		write(L, string'(", esperado:   "));
		hwrite(L, valor);
	end if;
	writeline(output, L);
	assert LE = valor report "valor no esperado" severity warning; --failure;
end procedure;

end package body procedimientos_pkg;
