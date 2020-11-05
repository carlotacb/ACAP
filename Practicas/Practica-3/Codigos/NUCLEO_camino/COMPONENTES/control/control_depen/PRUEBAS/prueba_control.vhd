--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.retardos_nucleo_pkg.all;

entity prueba_control is
  generic (semiperiodo: time:= 25 ns);
end prueba_control;		

architecture control of prueba_control is		

component control is     
port(reloj: in std_logic;
	Pcero, ini: in std_logic;
	IDL1, IDL2, IDE:out st_iden;
	finalop: out std_logic;
	selec, PE: out std_logic);
end component;

signal reloj, Pcero, selec, ini, PE: std_logic;
signal IDE: st_iden;
signal IDL1, IDL2: st_iden;
signal finalop: std_logic;

shared variable final : boolean := false;

begin		

controlc: control port map(reloj => reloj, Pcero => Pcero, ini => ini, IDL1 => IDL1, IDL2 => IDL2, IDE => IDE, finalop=> finalop, selec => selec, PE => PE); 

estimulos: Process 
begin 
	ini<= '0';
	Pcero <= '1';
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');

	ini<= '0';
	Pcero <= '0';
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');

	ini<= '1';
	Pcero <= '0';
	wait until finalop = '1';
	ini<= '0';
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');
	wait until (reloj'event and reloj = '1');


	final := true;
	wait;
end process;
 
process
begin
  if final = false then
    reloj <= '0';
    wait for semiperiodo; 
    reloj <= '1';
    wait for semiperiodo; 
  else
	  wait;
  end if;
end process;
 
 
end control;		

