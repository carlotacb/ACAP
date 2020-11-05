--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;

entity prueba_control is
end prueba_control;

architecture prueba of prueba_control is

component control is
   port (reloj, pcero: in std_logic;
	cabeza: in st_puntero;
	cola: in st_puntero;
	escritura, lectura: in std_logic;
	vacio: out std_logic;
	lleno: out std_logic );
end component;

procedure wait_until_falling_edges(signal reloj : in std_logic; n : in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

signal cabeza, cola: st_puntero;
signal vacio, lleno: std_logic;

signal reloj, pcero: std_logic;
signal lectura, escritura: std_logic;

shared variable final : boolean := false;

begin

condi_control: control port map (reloj => reloj, pcero => pcero, cabeza => cabeza, cola => cola, escritura => escritura, lectura => lectura, vacio => vacio, lleno => lleno);


estimulos: process
variable varcola, varcabeza: st_puntero;
begin
	pcero <= '1';
	escritura <= '0';
	lectura <= '0';
	cabeza <= (others => '0');
	cola <= (others => '0');
	wait_until_falling_edges(reloj,2);
	pcero <= '0';

	wait_until_falling_edges(reloj,1);
	cabeza <= (others => '0');
	cola <= (others => '0');
	escritura <= '0';
	lectura <= '0';		-- vacio

	wait_until_falling_edges(reloj,1);
	cabeza <= (others => '0');
	cola <= (0 => '1' , others => '0'); -- "001"
	escritura <= '1';
	lectura <= '0';		-- cambia a llenando
 
	wait_until_falling_edges(reloj,1);
	cabeza <= (others => '0');
	cola <= (others => '0');
	escritura <= '0';
	lectura <= '1';		-- esta llenando (previo) y lectura --> vacio

	wait_until_falling_edges(reloj,1);
	cabeza <= (others => '0');
	cola <= (0 => '0' , others => '1'); --"110";
	escritura <= '1';
	lectura <= '0';		-- cambia a llenando

	wait_until_falling_edges(reloj,1);
	cabeza <= (others => '0');
	cola <= (others => '0');
	escritura <= '1';
	lectura <= '0';		-- llenando y escribe --> lleno

	cabeza <= (others => '0');
	for i in 0 to 15 loop
		varcola := std_logic_vector(to_unsigned(i mod (2**tam_puntero), varcola'length));
		cola <= varcola;
		escritura <= '1';
		lectura <= '0';
		if i mod 2 = 0 then
			cabeza <= std_logic_vector(unsigned(cabeza) +1) ;
			lectura <= '1';
		end if;
    	wait_until_falling_edges(reloj,1);
	end loop;  

	cola <= (others => '0');
	for i in 0 to 15 loop
		cabeza <= std_logic_vector(to_unsigned(i mod (2**tam_puntero), cabeza'length));
		escritura <= '0';
		lectura <= '1';
		if i mod 2 = 0 then
			cola <= std_logic_vector(unsigned(cola) +1) ;
			escritura <= '1';
		end if;
    	wait_until_falling_edges(reloj,1);
	end loop;  

    assert FALSE report "Comprobacion finalizada." severity note;
	 final := true;
    wait;
end process;


process
begin
  if final = false then
    reloj <= '0';
    wait for 10 ns;
    reloj <= '1';
    wait for 10 ns;
	else
	  wait;
	end if;
end process;

end;
