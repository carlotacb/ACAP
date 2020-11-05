--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;
use work.retardos_buffer_pkg.all;

entity prueba_control is
end prueba_control;

architecture prueba of prueba_control is

component control is
   port (cabeza: in st_puntero;
	cola, colaincr: in st_puntero;
	vacio: out std_logic;
	lleno: out std_logic);
end component;

signal cabeza, cola, colaincr: st_puntero;
signal vacio, lleno: std_logic;

begin

condi_control: control port map (cabeza => cabeza, cola => cola, colaincr => colaincr, vacio => vacio, lleno => lleno);


estimulos: process
variable varcola, varcabeza: st_puntero;
begin
	cabeza <= "000";
	cola <= "000";
	colaincr <= "001";
    wait for 2*retcontrol;

	cabeza <= "001";
	cola <= "000";
	colaincr <= "001";
    wait for 2*retcontrol;

	cabeza <= "000";
	cola <= "000";
	colaincr <= "001";
    wait for 2*retcontrol;

	cabeza <= "000";
	for i in 0 to 15 loop
		varcola := std_logic_vector(to_unsigned(i mod (2**tam_puntero), varcola'length));
		cola <= varcola;
		colaincr <= std_logic_vector(unsigned(varcola) + 1) ;
		if i mod 2 = 0 then
			cabeza <= std_logic_vector(unsigned(cabeza) + 1) ;
		end if;
    	wait for 2*retcontrol;
	end loop;  

	wait;
end process;

end;
