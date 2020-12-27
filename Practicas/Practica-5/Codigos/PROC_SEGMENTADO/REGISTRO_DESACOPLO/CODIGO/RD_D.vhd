--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RD_D is						
   port (reloj: in std_logic;
         e: in tam_dat_camino;
         s: out tam_dat_camino);
end;

architecture comportamiento of RD_D is
  begin
     process (reloj) begin
       if reloj'event and reloj = '1' then
              s <= e after retREGDES;
       end if;
     end process;
end;

