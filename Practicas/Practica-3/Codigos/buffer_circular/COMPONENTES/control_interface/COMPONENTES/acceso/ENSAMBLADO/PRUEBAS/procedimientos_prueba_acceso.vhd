--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cte_tipos_buffer_pkg.all;

package procedimientos_prueba_acceso_pkg is

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer);

procedure escribir (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic);

procedure leer (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic);

procedure concesclec (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic);

procedure desactivar (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic);

end package procedimientos_prueba_acceso_pkg;

package body procedimientos_prueba_acceso_pkg is

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure escribir (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic) is
begin
  wait_until_falling_edges(reloj,1);
	escritura <= '1';
	lectura <= '0';
end procedure;

procedure leer (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic) is
begin
	wait_until_falling_edges(reloj,1);
	escritura <= '0';
	lectura <= '1';
end procedure;

procedure concesclec (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic) is
begin
	wait_until_falling_edges(reloj,1);
	escritura <= '1';
	lectura <= '1';
end procedure;

procedure desactivar (signal escritura: out std_logic; signal lectura: out std_logic; signal reloj: in std_logic) is
begin
	wait_until_falling_edges(reloj,1);
	escritura <= '0';
	lectura <= '0';
end procedure;

end package body procedimientos_prueba_acceso_pkg;
