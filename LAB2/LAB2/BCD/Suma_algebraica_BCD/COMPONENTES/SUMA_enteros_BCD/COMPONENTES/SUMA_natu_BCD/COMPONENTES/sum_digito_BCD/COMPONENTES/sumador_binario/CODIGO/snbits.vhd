--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_bcd_pkg.all;
use work.retardos_bcd_pkg.all;

entity snbits is
port (X: in  st_bcd;
	Y: in  st_bcd;
	cen: in std_logic;
	sum: out st_bcd;
	csal: out std_logic);
end snbits;

architecture compor of snbits is
signal sum_ext : unsigned(num_bcd+1 downto 0);

begin
  sum_ext  <= resize(unsigned(X)&'1', num_bcd+2)+resize(unsigned(Y)&cen, num_bcd+2) after retsumbin;
  sum   <= std_logic_vector(sum_ext(num_bcd downto 1));    
  csal <= sum_ext(num_bcd+1);
end compor;

