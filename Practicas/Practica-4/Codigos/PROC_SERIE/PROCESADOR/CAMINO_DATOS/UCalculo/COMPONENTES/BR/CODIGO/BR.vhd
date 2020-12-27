--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity BR is
	port(reloj:	in std_logic;
		IDL1:	in dir_reg;				-- 2 puertos de lectura combinacionales
		IDL2:	in dir_reg;
		L1:		out tam_dat_camino;
		L2:		out tam_dat_camino;
		IDE:	in dir_reg;				-- 1 puerto de escritura sincrono
		DE:		in tam_dat_camino;
		PE:		in std_logic);
end BR;

architecture compor of BR is
	-- Banco de registros tipo array.
	type tipo_Banco is array(0 to numRegistros-1) of std_logic_vector(tam_dat-1 downto 0);

signal Banco_R : tipo_Banco; 
signal tmp: integer;

begin

tmp <= to_integer(unsigned(IDE)) after retdecoBR; -- simula retardo del decodificador

banco_registros: process(reloj)
begin
	if rising_edge(reloj) then
		if PE = '1' then
			Banco_R(tmp) <= DE  after retescBR;
		end if;
	end if;
end process;

	L1 <= Banco_R(to_integer(unsigned(IDL1))) after retlecBR when IDL1 /= "00000" else (others => '0') after retlecBR;
	L2 <= Banco_R(to_integer(unsigned(IDL2))) after retlecBR when IDL2 /= "00000" else (others => '0') after retlecBR;

end;


