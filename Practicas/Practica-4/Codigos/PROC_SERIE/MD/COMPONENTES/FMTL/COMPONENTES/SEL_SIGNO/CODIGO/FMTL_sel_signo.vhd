--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.tipos_constan_memoria_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

entity FMTL_sel_signo is 
port (d: in	selec_bytes_contenedor;
	sel: in	dir_bytes_contenedor;
	opMD: in st_opMD;
	s: out	std_logic);
end FMTL_sel_signo;		
		
architecture comportamiento of FMTL_sel_signo is	
signal dirsigno: dir_bytes_contenedor; 
begin		
    dirsigno <= sel(1) & (sel(0) or opMD(0));
	 s <= d(to_integer(unsigned(dirsigno)));	
end comportamiento;		

