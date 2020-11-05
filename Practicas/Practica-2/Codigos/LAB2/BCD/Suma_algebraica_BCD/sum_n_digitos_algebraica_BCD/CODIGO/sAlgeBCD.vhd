--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;
use work.componentes_sum_algebraica_pkg.all;

entity sAlgeBCD is
port (a: in st_ndig_bcd_mas_1;
	b: in st_ndig_bcd_mas_1;
	sumres: in std_logic;
	s: out st_ndig_bcd_mas_1;
	irre: out std_logic);
end sAlgeBCD;

architecture estructural of sAlgeBCD is

signal Z, bcomp: st_ndig_bcd_mas_1;

begin
-- instanciacion compl9 mediante sentencias generate
	Z <= (others => '0');

-- seleccion operando B
	bcomp <= b after retmux when sumres '0' else Z after retmux;

-- instantacion sumador

	s <= (others => '0');
	irre <= '0';


end estructural;

