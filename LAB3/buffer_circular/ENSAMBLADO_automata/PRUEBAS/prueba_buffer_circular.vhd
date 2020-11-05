--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;
use work.procedimientos_prueba_buffer_pkg.all;

entity prueba_buffer_circular is 	
end prueba_buffer_circular;

architecture prueba of prueba_buffer_circular is	

component buffer_circular is 
port (reloj, pcero: in std_logic;
	datoE: in st_datos;
	validoP, listoC: in std_logic;
	listoB, validoB: out std_logic;
	datoL: out st_datos);
end component;

signal reloj, pcero: std_logic;
signal datoE, datoL: st_datos;
signal validoP, listoC, listoB, validoB: std_logic;

signal DATprocesado: st_datos;
signal valDATcons: st_datos;

shared variable final, final_P, final_C : boolean := false;

signal inicio: std_logic := '0';
signal cntciclos: integer := 0;

constant periododiv2 : time := 15 ns;

begin

buffercir: buffer_circular port map(reloj => reloj, pcero => pcero, datoE => datoE, validoP => validoP, listoC => listoC, validoB => validoB, listoB => listoB, datoL => datoL); 


estimulos: process
begin
	pcero <= '1';
	wait_until_falling_edges(reloj,2);
	pcero <= '0';
	inicio <= '1';
	wait_until_falling_edges(reloj,1);
	inicio <= '0';
	wait;
end process;

productor: process
variable valdatoE: st_datos;
variable tiempoproducir: positive;

begin
	validoP <= '0';
	wait until inicio = '1';
	for i in 0 to 9 loop -- latencia produccion: 1 op/ciclo
		tiempoproducir := 1;
		valdatoE := std_logic_vector(to_unsigned(i+1,tam_camino));
		producir (reloj, tiempoproducir, valdatoE, validoP, datoE);
		interface(reloj, listoB);
		assert validoP = '1' and datoE = valdatoE report "Error Productor" severity failure;
		report CR &LF & "Insercion. Ciclo: " & integer'image(cntciclos) & "   Valor: " & integer'image(to_integer(unsigned(valdatoE)));
	end loop;

	for i in 0 to 7 loop -- productor en reposo
		wait until falling_edge(reloj);	
		validoP <= '0';
		datoE <= (others => 'X');
	end loop;

	for i in 10 to 14 loop -- latencia produccion: 2 op/ciclo
		tiempoproducir := 2;
		valdatoE := std_logic_vector(to_unsigned(i+1,tam_camino));
		producir (reloj, tiempoproducir, valdatoE, validoP, datoE);
		interface(reloj, listoB);
		assert validoP = '1' and datoE = valdatoE report "Error Productor" severity failure;
		report CR &LF & "Insercion. Ciclo: " & integer'image(cntciclos) & "   Valor: " & integer'image(to_integer(unsigned(valdatoE)));
	end loop;
	
	wait until falling_edge(reloj);
	report CR &LF & "productor ha finalizado.";
	validoP <= '0';
	final_P := true;
 	wait;
end process;

consumidor: process
variable tiempoconsumir: positive;
variable valdatoL: st_datos;
begin
	listoC <= '0';
	wait until inicio = '1';
	for i in 0 to 9 loop  -- consumidor en reposo
		wait until falling_edge(reloj);	
	end loop;

	listoC <= '1';
	for i in 0 to 12 loop -- latencia consumo: 1.5 op/ciclo
		interface(reloj, validoB);

		report CR &LF & "Extraccion. Ciclo: " & integer'image(cntciclos) & "   Valor: " & integer'image(to_integer(unsigned(datoL)));
		assert to_integer(unsigned(datoL)) = i + 1 --
		report CR &LF & " error en la extraccion" & "   iteracion: " & integer'image(i) severity failure; --;

		tiempoconsumir := 1 + (i mod 2);
		valDATcons <= datoL; -- muestreo de datoL
		wait for 0 ps;
		consumir (reloj, tiempoconsumir, listoC, valDATcons, DATprocesado);
		wait for 0 ps;
		assert listoC = '1' and DATprocesado = std_logic_vector(to_unsigned(i+1,tam_camino)) report "Error Consumidor" severity failure;

	end loop;

	wait until falling_edge(reloj);
	report CR &LF & "consumidor ha finalizado.";
	listoC <= '0';
	final_C := true;
	wait;
end process;

finalizar: process
begin
	if final_P = true and final_C = true then
		final := true;
	end if;
	wait until rising_edge(reloj);
end process;
		

process
begin
	if final = false and cntciclos < 50 then
		reloj <= '0';
		wait for periododiv2;
		reloj <= '1';
		cntciclos <= cntciclos + 1;
		wait for periododiv2;
	else
		report CR &LF & "Prueba finalizada.";
		wait;
	end if;
end process;

end prueba;

