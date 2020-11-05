--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;
use work.componentes_snBCD_pkg.all;

entity sentBCD is
port (a: in st_ndig_bcd_mas_1;
	b: in st_ndig_bcd_mas_1;
	cen: in std_logic;
	s: out st_ndig_bcd_mas_1;
	irre: out std_logic );
end sentBCD;

architecture estructural of sentBCD is
--senyales

begin

	s <= (others => '0');
	irre <= '0';

end estructural;

