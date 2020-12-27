--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.retardos_pkg.all;

entity sumalg is
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
			 men : out std_logic;
          s	: out tam_dat_camino);
end sumalg;

architecture compor of sumalg is

signal aa, bb, cc, ss: std_logic_vector(tam_dat downto 0);
signal an, bn: std_logic;
signal ent, resta: std_logic; -- ent=1/0 dato entero/natural; resta=1/0 resta/suma 

begin
--	exprese las senyales de control en funcion de opALU
	resta <= '0';
	ent <= '0';

--	extension de rango y vectores a sumar
	an <= '0';
	bn <= '0';
	aa <= an & a;
	bb <= (bn & b) xor (tam_dat downto 0 => resta);

--	suma aa + bb + cc
	cc <= (tam_dat downto 1 => '0', 0 => resta);
	ss <= std_logic_vector(unsigned(aa)+unsigned(bb)+unsigned(cc));
	
--	modifique las senyales de salida
	s <= (others => '0');
	men <= '0';
	

end;
