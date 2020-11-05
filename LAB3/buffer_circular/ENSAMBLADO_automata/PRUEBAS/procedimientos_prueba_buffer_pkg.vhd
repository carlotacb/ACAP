--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;

package procedimientos_prueba_buffer_pkg is

procedure wait_until_falling_edges(signal reloj : in std_logic; n : in integer);

procedure interface(signal reloj: in std_logic; signal listo: in std_logic);

procedure producir (signal reloj: in std_logic; variable tiempoproducir: in integer; variable valor: in st_datos; signal validoP: out std_logic; signal DATproducido: out st_datos);

procedure consumir (signal reloj: in std_logic; variable tiempoconsumir: in integer; signal listo_C: out std_logic; signal DATconsumidor: in st_datos; signal DATprocesado: out st_datos);
end package procedimientos_prueba_buffer_pkg;

package body procedimientos_prueba_buffer_pkg is

procedure wait_until_falling_edges(signal reloj : in std_logic; n : in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure interface(signal reloj: in std_logic; signal listo: in std_logic) is
-- el productor espera hasta que el dato se inserta en el buffer
-- el consumidor espera hasta que el dato leido del buffer es valido
begin
	wait until rising_edge(reloj) and listo = '1';
end procedure;

procedure producir (signal reloj: in std_logic; variable tiempoproducir: in integer; variable valor: in st_datos; signal validoP: out std_logic; signal DATproducido: out st_datos) is
-- DATproducido: dato de salida del productor 
-- el productor notifica al buffer en el flanco de bajada del ultimo ciclo de la operacion
begin
	wait_until_falling_edges(reloj, 1);
	validoP <= '0';
	DATproducido <= (others => 'X');
	wait_until_falling_edges(reloj, tiempoproducir - 1);
	DATproducido <= valor;
	validoP <= '1';
end procedure; 

procedure consumir (signal reloj: in std_logic; variable tiempoconsumir: in integer; signal listo_C: out std_logic; signal DATconsumidor: in st_datos; signal DATprocesado: out st_datos) is
-- DATconsumidor: dato de entrada del consumidor
-- DATprocesado: dato de salida del consumidor 
-- el consumidor notifica al buffer en el flanco de bajada del ultimo ciclo de la operacion
begin
	wait_until_falling_edges(reloj, 1);
	listo_C <= '0';
	DATprocesado <= (others => 'X');
	wait_until_falling_edges(reloj, tiempoconsumir - 1);
	DATprocesado <= DATconsumidor;
	listo_C <= '1';
end procedure; 

end package body procedimientos_prueba_buffer_pkg;

