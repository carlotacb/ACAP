--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package param_disenyo_pkg is

-- Banco de registros
constant numRegistros: integer:= 32;
constant lognumReg: integer:= 5;
subtype dir_reg is std_logic_vector(lognumReg-1 downto 0);

-- Camino de datos
constant tam_dat: integer:= 32;
subtype tam_dat_camino is std_logic_vector(tam_dat-1 downto 0);

-- Busqueda de instruccion. Lectura de MI
constant tam_instruc: integer:= 32;
subtype tipo_inst_busq is std_logic_vector(tam_instruc-1 downto 0);

-- Direccion de acceso a MI
constant tam_direcc: integer:= 32;
subtype tipo_direc_inst is std_logic_vector(tam_direcc-1 downto 0);

-- Memorias
constant tam_byte: integer:= 8;
constant tam_ELogico_datos: integer:= 1024*4; -- en bytes
constant tam_ELogico_datos_I: integer:= 512*4; -- en bytes
subtype byte is std_logic_vector(tam_byte-1 downto 0);

end package param_disenyo_pkg;
