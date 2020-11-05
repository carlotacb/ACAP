--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use work.all;		
		
-- La especificación del componente en VHDL está en otro fichero 
-- Los componentes se conectan mediante un vector de señales		
		
entity snbits is
	generic (tam: positive:= 4);
	port (a: in std_logic_vector(tam-1 downto 0);
		b: in std_logic_vector(tam-1 downto 0);
		cen: in std_logic;
		s: out std_logic_vector(tam-1 downto 0);
		csal: out std_logic );
end snbits;

architecture estructural of snbits is
	component s1bit
		generic(retardoxor: time;
			retardoand: time;
			retardoor: time);
		port (x: in std_logic; y: in std_logic; cen: in std_logic;
			s: out std_logic; csal: out std_logic);
	end component;

--senyales para las conexiones

begin
-- instanciacion de componentes e interconexion

end estructural;
