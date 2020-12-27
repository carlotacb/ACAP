--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

entity cmp is 									
generic(tam: natural := lognumReg);			
	port(a, b: in std_logic_vector(tam-1 downto 0);
		ig: out std_logic);
end cmp;

architecture compor of cmp is
constant cero: std_logic_vector(tam-1 downto 0) := (others =>'0');
signal igual: std_logic_vector(tam-1 downto 0);
begin
	igual <= a xor b;
	ig <= '1' when igual = cero else
			'0';
end;

