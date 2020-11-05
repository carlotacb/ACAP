--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;
--! @image html BR.png 

entity BR is
	port (reloj	: in  std_logic;
		ED			: in  st_datos;
		dirE		: in  st_puntero;
		dirL		: in  st_puntero;
		pe			: in  std_logic;
		LD			: out st_datos);
end BR;

architecture rtl of BR is
	type RAM is array(0 to 2 ** tam_puntero - 1) of st_datos;
	signal registros: RAM;
	
begin
	process (reloj)
	begin
		if (reloj'event and reloj = '1') then
			if (pe = '1') then
			    registros(to_integer(unsigned(dirE))) <= ED after retBRES;
			end if;
		end if;
	end process;

	LD <= registros(to_integer(unsigned(dirL))) after retBRLE;

end rtl;
