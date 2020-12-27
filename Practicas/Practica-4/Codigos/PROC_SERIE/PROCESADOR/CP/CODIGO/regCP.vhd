--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;

entity regCP is							-- registro con inicializacion a cero asincrona
	port (reloj, Pcero: in std_logic;		-- Pcero: senyal de inicializacion
         e: in tipo_direc_inst;
         s: out tipo_direc_inst);
end regCP;

architecture comportamiento of regCP is
begin
	process (reloj, pcero) begin
		if Pcero = '1' then s <= (others => '0') after retREGCP;
		elsif reloj'event and reloj = '1' then
			s <= e after retREGCP;
		end if;
	end process;
end;

