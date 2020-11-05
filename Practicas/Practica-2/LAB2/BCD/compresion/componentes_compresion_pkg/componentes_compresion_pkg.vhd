--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;

package componentes_compresion_pkg is

component sAlgeBCD is
port (a: in st_ndig_bcd_mas_1;
	b: in st_ndig_bcd_mas_1;
	sumres: in std_logic;
	s: out st_ndig_bcd_mas_1;
	irre: out std_logic );
--	csal: out std_logic );
end component;

component BCDaDPD is
port(en: in st_tres_dig_BCD;
	sa: out st_tres_dig_DPD);
end component;

component DPDaBCD is
port(en: in st_tres_dig_DPD; 
	sa: out st_tres_dig_BCD); 
end component;

end package componentes_compresion_pkg;

