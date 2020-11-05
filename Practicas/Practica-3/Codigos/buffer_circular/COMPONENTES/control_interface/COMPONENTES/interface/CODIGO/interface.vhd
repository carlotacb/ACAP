--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_buffer_pkg.all;
--! @image html interface.png 

entity interface is
   port (lis_val: in std_logic;
	estado: in std_logic;
	val_lis: out std_logic;
	accion: out std_logic );
end interface;

architecture compor of interface is
signal val_lis1: std_logic;

begin
	val_lis1 <= (not estado) after retinterface;
	accion <= val_lis1 and lis_val after retinterface;
	val_lis <= val_lis1;
end;

