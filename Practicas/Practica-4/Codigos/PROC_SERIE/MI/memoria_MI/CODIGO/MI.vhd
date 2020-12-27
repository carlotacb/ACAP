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
-- para que Quartus infiera una ram hay que especificar la direccion como integer (manual de Altera)
-- si se especifica como std_logic_vector Quartus no efectua la inferencia
entity MI is
port (
	direc : in integer range 0 to num_contenedores_Elogico_I-1;   
	datoL : out tam_dat_camino_MI ); 
end MI;

architecture rtl of MI is

constant fitxer_codi: string := "../../../../ENSAMBLADO/PRUEBAS/CODI_imem.hex";
signal datoL_local : contenedor_I;

signal ram : t_ramI:= ini_mem_I(fitxer_codi);

begin -- reoorganizacion de los datos leidos de la ram para adecuarse a la salida

desempaquetar: for i in 0 to num_bytes_I-1 generate
	datoL(tam_byte*(i+1) - 1 downto tam_byte*i) <= datoL_local(i);
end generate desempaquetar;
	
	datoL_local <= ram(direc) after retlecMI;

end rtl;
