--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_nucleo_pkg.all;

entity multiplexor is 
generic (tam: natural);
port (e0, e1: in std_logic_vector (tam-1 downto 0);
         selec : in std_logic;
         sal: out std_logic_vector (tam-1 downto 0));
end multiplexor; 

architecture compor of multiplexor is

begin
         sal <= e0 when (selec ='0') else e1;
end compor;

