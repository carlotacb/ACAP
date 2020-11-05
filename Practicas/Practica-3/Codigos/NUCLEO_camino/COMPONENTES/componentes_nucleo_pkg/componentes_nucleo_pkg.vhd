--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;

package componentes_nucleo_pkg is

component BR is      -- banco de registros con tres puertos
port(reloj: in std_logic;
       PE: in std_logic;
       IDL1, IDL2, IDE:in st_iden;
       DE: in st_datos;
       LE1, LE2: out st_datos);
end component;

component control is     
port(reloj: in std_logic;
	Pcero, ini: in std_logic;
	IDL1, IDL2, IDE:out st_iden;
	finalop: out std_logic;
	selec, PE: out std_logic);
end component;

component multiplexor_1 is 
port (e0, e1: in std_logic;
         selec : in std_logic;
         sal: out std_logic);
end component; 

component multiplexor is 
generic (tam: natural);
port (e0, e1: in std_logic_vector (tam-1 downto 0);
         selec : in std_logic;
         sal: out std_logic_vector (tam-1 downto 0));
end component; 

component sumador is
port (a, b: in st_datos;
	s: out st_datos);
end component;

end package componentes_nucleo_pkg;

