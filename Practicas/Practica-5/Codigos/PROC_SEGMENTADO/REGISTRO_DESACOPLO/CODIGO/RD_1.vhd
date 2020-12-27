--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RD_1 is							-- registro con inicializacion a cero asincrona
  port (reloj, pcero: in std_logic;		-- pes: senyal de inicializacion
         e: in std_logic;
         s: out std_logic);
end;

architecture comportamiento of RD_1 is
  begin
     process (reloj, pcero) begin
       if pcero = '1' then s <= '0' after retREGDES;
       elsif reloj'event and reloj = '1' then
              s <= e after retREGDES;
       end if;
     end process;
end;

