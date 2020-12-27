--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RDI_N is							-- registro con inicializacion a cero asincrona
  generic (tam: natural := 5);
  port (reloj, pcero, I: in std_logic;		-- pcero: senyal de inicializacion
         e: in std_logic_vector (tam-1 downto 0);					-- B: senyal modo burbuja, inyectar
         s: out std_logic_vector (tam-1 downto 0));
end;

architecture comportamiento of RDI_N is
  begin
     process (reloj, pcero) begin
       if pcero = '1' then s <=  (others => '0') after retREGDES;
       elsif reloj'event and reloj = '1' then
          if I ='1' then
              s <= (others => '0') after retREGDES;
          else      
              s <= e after retREGDES;
          end if;
       end if;
     end process;
end;

