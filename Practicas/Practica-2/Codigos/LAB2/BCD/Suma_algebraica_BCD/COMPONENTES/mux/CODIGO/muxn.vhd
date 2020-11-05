 
--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_bcd_pkg.all;

entity muxn is 
generic (n: positive);
port (e0, e1: in std_logic_vector(n-1 downto 0);
         selec : in std_logic;
         sal: out std_logic_vector(n-1 downto 0));
end muxn; 

architecture compor of muxn is

begin

    sal <= e0 after retmux when (selec ='0') else e1 after retmux;

end compor;
