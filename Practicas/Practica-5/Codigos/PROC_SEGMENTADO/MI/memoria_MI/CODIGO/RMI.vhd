--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.param_disenyo_pkg.all;
use work.tipos_constan_memoria_I_pkg.all;
use work.retardos_pkg.all;
use work.inicializa_mem_I_pkg.all;

-- ram con senyales de escritura independiente por byte de palabra. 
-- para que Quartus infierra una ram hay que especificar la direccion como integer (manual de Altera)
-- si se especifica como std_logic_vector Quartus no efectua la inferencia
entity RMI is
port (
	reloj: in std_logic; 
	direc : in integer range 0 to num_contenedores_Elogico_I-1;   
	datoL : out tam_dat_camino_MI ); 
end RMI;

architecture rtl of RMI is

constant fitxer_codi: string := "../../../../ENSAMBLADO/PRUEBAS/CODI_imem.hex";
signal datoL_local : contenedor_I;

signal ram : t_ramI:= ini_mem_I(fitxer_codi);
signal dirlectu: integer range 0 to num_contenedores_Elogico_I-1; -- registrar direccion de lectura

begin -- reoorganizacion de los datos leidos de la ram para adecuarse a la salida

desempaquetar: for i in 0 to num_bytes_I-1 generate
	datoL(tam_byte*(i+1) - 1 downto tam_byte*i) <= datoL_local(i);
end generate desempaquetar;
	
byte4: process(reloj)
begin
	if(rising_edge(reloj)) then
		dirlectu <= direc; -- registrar direccion de lectura
	end if;
end process;

	datoL_local <= ram(dirlectu)  after retlecMI;
end rtl;

