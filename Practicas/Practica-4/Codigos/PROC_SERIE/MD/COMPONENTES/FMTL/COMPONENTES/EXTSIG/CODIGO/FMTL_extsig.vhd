--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.componentes_MD_pkg.all;

entity FMTL_extsig is
port(signo: in std_logic;
	d0: in tam_dat_camino_MD;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end FMTL_extsig;

architecture estructural of FMTL_extsig is

signal SEL: std_logic_vector(num_bytes_contenedor-1 downto 1);

begin

SEL(1) <= (not opMD(0)) and (not opMD(1)); 
SEL(2) <= (not opMD(1)); 
SEL(3)  <= (not opMD(1)); 

sal(7 downto 0) <= d0(7 downto 0);
selec: for i in 1 to num_bytes_contenedor-1 generate
signal conex: std_logic_vector(7 downto 0);
begin
entd1: for j in 0 to 7 generate
	co: conex(j) <= signo and not opMD(2);
end generate;

muxsig:	mux2M port map (d0 => d0(tam_byte*(i+1)-1 downto tam_byte*i), d1 => conex, SEL => SEL(i), s => sal(tam_byte*(i+1)-1 downto tam_byte*i));
end generate;
end; 


