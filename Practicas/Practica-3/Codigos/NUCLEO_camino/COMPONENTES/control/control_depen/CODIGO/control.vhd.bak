--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.retardos_nucleo_pkg.all;
use work.componentes_control_pkg.all;

entity control is     
port(reloj: in std_logic;
	Pcero, ini: in std_logic;
	IDL1, IDL2, IDE:out st_iden;
	finalop: out std_logic;
	selec, PE: out std_logic);
end control;

architecture estructura of control is

signal cnt, prxcnt: std_logic_vector(tam_secuencia-1 downto 0);
signal t_IDL1, t_IDL2, prxIDL1, prxIDL2, t_IDE, prxIDE: st_iden;
signal estado, prxestado: std_logic;
signal t_finalop: std_logic;

begin

estadoreg: reg1 port map(reloj => reloj, e => prxestado, s => estado);
	prxestado <= '0' when pcero ='1' or t_finalop = '1' else
				'1' when (ini = '1' and estado = '0') else
				'1' when estado = '1' 
				else '0';

contador: registro generic map(tam => tam_secuencia)
			port map(reloj => reloj, e => prxcnt, s => cnt);
	prxcnt <= "01000" when pcero = '1' or estado = '0' else std_logic_vector(unsigned(cnt) - 1);

-- modifique los automatas para generar la secuencia de operaciones con dependencias
	
IdenL1: registro generic map(tam => log_num_reg)
			port map(reloj => reloj, e => prxIDL1, s => t_IDL1);
	prxIDL1 <= (others => '0');

IdenL2: registro generic map(tam => log_num_reg)
			port map(reloj => reloj, e => prxIDL2, s => t_IDL2);
	prxIDL2 <= (others => '0');

IdenE: registro generic map(tam => log_num_reg)
			port map(reloj => reloj, e => prxIDE, s => t_IDE);
	prxIDE <= (others => '0');


	t_finalop <= '0' when pcero = '1' or estado = '0' else
			'1' when cnt = "00000" and estado = '1' and estado = '1'
			else '0';
	finalop <= t_finalop;

	selec <= not estado;

	PE <= estado;

	IDL1 <= t_IDL1;
	IDL2 <= t_IDL2;
	IDE <= t_IDE;

end;


