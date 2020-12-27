--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.tipos_constan_memoria_pkg.all;
use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;
use work.inicializa_mem_pkg.all;
--! @image html MD.png

-- ram con senyales de escritura independiente por byte de palabra. 
-- para que Quartus infiera una ram hay que especificar la direccion como integer (manual de Altera)
-- si se especifica como std_logic_vector Quartus no efectua la inferencia
entity MD is
port (reloj, PEM : in std_logic;
	direc : in integer range 0 to num_contenedores_Elogico_D-1;   
	selbyte : in std_logic_vector (num_bytes_contenedor-1 downto 0); 
	datoE : in tam_dat_camino_MD; 
	datoL : out tam_dat_camino_MD ); 
end MD;

architecture rtl of MD is

constant fitxer_dades: string := "../../../../ENSAMBLADO/PRUEBAS/DADES_dmem.hex";

signal datoL_local : contenedor_D;

signal ram : t_ramD:= ini_mem(fitxer_dades); 

begin -- reoorganizacion de los datos leidos de la ram para adecuarse a la salida

desempaquetar: for i in 0 to num_bytes_contenedor-1 generate
	datoL(tam_byte*(i+1) - 1 downto tam_byte*i) <= datoL_local(i);
end generate desempaquetar;
	
byte4: process(reloj)
begin
	if(rising_edge(reloj)) then
		if(PEM = '1') then
			if(selbyte(0) = '1') then
				ram(direc)(0) <= datoE(7 downto 0) after retescMD;
			end if;
			if selbyte(1) = '1' then
				ram(direc)(1) <= datoE(15 downto 8) after retescMD;
			end if;
			if selbyte(2) = '1' then
				ram(direc)(2) <= datoE(23 downto 16) after retescMD;
			end if;
			if selbyte(3) = '1' then
				ram(direc)(3) <= datoE(31 downto 24) after retescMD;
			end if;
		end if;
	end if;
end process;
	datoL_local <= ram(direc) after retlecMD;
end rtl;
