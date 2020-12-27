--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package RegDes_pkg is

component RD_1 is							-- registro con inicializacion a cero asincrona
  port (reloj, pcero: in std_logic;		-- pcero: senyal de inicializacion
         e: in std_logic;
         s: out std_logic);
end component;

component RDI_1 is							-- registro con inicializacion a cero asincrona
  port (reloj, pcero, I: in std_logic;		-- pcero: senyal de inicializacion
         e: in std_logic;					-- I: senyal modo burbuja, inyectar
         s: out std_logic);
end component;

component RDI_N is							-- registro con inicializacion a cero asincrona
  generic (tam: natural := 5);
  port (reloj, pcero, I: in std_logic;		-- pcero: senyal de inicializacion
         e: in std_logic_vector (tam-1 downto 0);					-- I: senyal modo burbuja, inyectar
         s: out std_logic_vector (tam-1 downto 0));
end component;

component RD_N is							-- registro con inicializacion a cero asincrona
  generic (tam: natural := 5);
  port (reloj, pcero: in std_logic;		-- pcero: senyal de inicializacion
         e: in std_logic_vector (tam-1 downto 0);
         s: out std_logic_vector (tam-1 downto 0));
end component;

component RD_D is						
   port (reloj: in std_logic;
         e: in tam_dat_camino;
         s: out tam_dat_camino);
end component;

component RDB_N is							-- registro con inicializacion a cero asincrona
 generic (tam: natural := 32);
  port (reloj, pcero, B: in std_logic;					-- pcero: senyal de inicializacion
         e: in std_logic_vector(tam-1 downto 0);	-- B: senyal modo bloqueo
         s: out std_logic_vector(tam-1 downto 0));
end component;

component RDB_DL_N is							-- registro con inicializacion a cero asincrona (nop canonica)
 generic (tam: natural := 32);
  port (reloj, pcero, B: in std_logic;					-- pcero: senyal de inicializacion
         e: in std_logic_vector(tam-1 downto 0);	-- B: senyal modo bloqueo
         s: out std_logic_vector(tam-1 downto 0));
end component;

end package RegDes_pkg;
