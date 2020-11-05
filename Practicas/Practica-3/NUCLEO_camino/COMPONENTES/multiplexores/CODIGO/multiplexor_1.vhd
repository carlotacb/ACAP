--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_1 is 
port (e0, e1: in std_logic;
         selec : in std_logic;
         sal: out std_logic);
end multiplexor_1; 

architecture compor of multiplexor_1 is

begin
         sal <= e0 when (selec ='0') else e1;
end compor;

