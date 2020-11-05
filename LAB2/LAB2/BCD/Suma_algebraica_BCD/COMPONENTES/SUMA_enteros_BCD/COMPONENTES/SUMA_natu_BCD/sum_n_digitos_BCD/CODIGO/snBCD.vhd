--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
--use work.all;
use work.cte_tipos_bcd_pkg.all;
use work.componentes_s1BCD_pkg.all;

entity snBCD is
port (a: in st_ndig_bcd;
	b: in st_ndig_bcd;
	cen: in std_logic;
	s: out st_ndig_bcd;
	csal: out std_logic );
end snBCD;

architecture estructural of snBCD is

signal c : st_ndig_bcd_mas_1;

begin

	c(0) <= cen;
sumador: for i in 0 to ndigitos-1 generate
	sumi: s1bcd port map (X => a(num_bcd*(i+1)-1 downto num_bcd*i), Y => b(num_bcd*(i+1)-1 downto num_bcd*i), cen => c(i), S => s(num_bcd*(i+1)-1 downto num_bcd*i), csal => c(i+1));
end generate;

	csal <= c(ndigitos);
end estructural;

