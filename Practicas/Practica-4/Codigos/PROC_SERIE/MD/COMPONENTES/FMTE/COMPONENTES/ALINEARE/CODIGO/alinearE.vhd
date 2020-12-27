--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.componentes_MD_pkg.all;

entity alinearE is
port(ent: in tam_dat_camino_MD;
	dirbyte: in dir_bytes_contenedor;
	sal: out tam_dat_camino_MD);
end alinearE;

architecture estructura of alinearE is

function lim_inf_direc (j, k: integer) return integer is
begin
return 2 *(k-1)*(num_bytes_contenedor/ (2**j));
end function lim_inf_direc;

function lim_sup_direc (j, k: integer) return integer is
begin
return (2*K-1)*(num_bytes_contenedor/ (2**j));
end function lim_sup_direc;


function lim_sup_conex (j, k: integer) return integer is
begin
return 2 * K*(num_bytes_contenedor/ (2**j));
end function lim_sup_conex;

subtype byte is std_logic_vector(tam_byte-1 downto 0);

type matriz is array (0 to num_bytes_contenedor-1, 0 to lognum_bytes_contenedor) of byte;
signal conexiones: matriz;

type seleccion is array ( 1 to lognum_bytes_contenedor) of std_logic;
signal SEL: seleccion;

begin
	
entr: for i in 0 to  num_bytes_contenedor-1 generate
	conexiones(i,0) <= ent(tam_byte*(i+1)-1 downto tam_byte*i);
end generate;

columna: for j in 1 to lognum_bytes_contenedor generate
	SEL(j) <= dirbyte(lognum_bytes_contenedor-j);
	iter: for k in 1 to 2**(j-1) generate
		filaa: for i in lim_inf_direc(j,k) to lim_sup_direc(j,k) -1 generate
			conexiones(i,j) <= conexiones(i,j-1);
		end generate;
		filab: for i in lim_sup_direc(j,k) to lim_sup_conex(j,k) -1 generate
			gencoluma:	mux2M port map (d0 => conexiones(i,j-1), d1 => conexiones(i-(num_bytes_contenedor/(2*j)),j-1), SEL => SEL(j), s => conexiones(i,j));
		end generate;
	end generate;
end generate;

salid: for i in 0 to  num_bytes_contenedor-1 generate
	sal(tam_byte*(i+1)-1 downto tam_byte*i) <= conexiones(i,lognum_bytes_contenedor);
end generate;

end; 


