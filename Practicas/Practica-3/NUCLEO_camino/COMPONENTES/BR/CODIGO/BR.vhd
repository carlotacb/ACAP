--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.retardos_nucleo_pkg.all;
--! @image html BR_nucleo.png 

entity BR is      -- banco de registros con tres puertos
port(reloj: in std_logic;
       PE: in std_logic;
       IDL1, IDL2, IDE:in st_iden;
       DE: in st_datos;
       LE1, LE2: out st_datos);
end;

architecture compor of BR is
signal mem: ramtype := (0 => (others => '0'), others => (others => 'U'));
signal idedeco: st_iden;
constant id_0: st_iden := (others => '0'); 
 
begin
-- Banco de registros de 3 puertos.
-- Los puertos de lectura son asincronos.
-- El puerto de escritura se escribe en el flanco ascendente de la senyal de reloj.
-- El registro con indice cero esta cableado al valor cero

	idedeco <= IDE after retBRdeco; -- simula el retardo del decodificador del identificador del registro de escritura
	
process(reloj)
begin 
	if rising_edge(reloj) then
		if (PE = '1') then 
			if idedeco /= id_0 then
				mem(to_integer(unsigned(idedeco))) <= DE after retBRES;
			end if;
		end if;
	end if;
end process;

	LE1 <= mem(to_integer(unsigned(IDL1))) after retBRLE;
	LE2 <= mem(to_integer(unsigned(IDL2))) after retBRLE;
	
end;

