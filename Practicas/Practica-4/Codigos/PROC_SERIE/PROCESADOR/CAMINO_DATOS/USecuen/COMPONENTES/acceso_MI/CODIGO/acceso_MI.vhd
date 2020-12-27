--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

use work.retardos_even_pkg.all;

entity acceso_MI is
	port (direccion: in tipo_direc_inst;	-- deteccion de direccion fuera de rango o no alineada
		MI_FR: out std_logic;			-- 16 bits mas significativos deben ser como maximo x"0000"
		MI_NA: out std_logic);			-- direccion no alineada
end acceso_MI;

architecture comport of acceso_MI is

    function To_Std_Logic(L: boolean) return std_ulogic is 
    begin 
        if L then 
            return('1'); 
        else 
            return('0'); 
        end if; 
    end function To_Std_Logic; 


constant cero3116: std_logic_vector(tam_direcc/2-1 downto 0):= (others =>'0');
constant cero10: std_logic_vector(1 downto 0):= (others =>'0');
signal t_fuera_rango: std_logic;
signal t_no_alineado: std_logic;

begin

	t_fuera_rango <= To_Std_Logic(direccion(tam_direcc-1 downto 16) /= cero3116);
	t_no_alineado <= To_Std_Logic(direccion(1 downto 0) /= cero10);

	MI_FR <= t_fuera_rango after retexcepMI;
	MI_NA <= t_no_alineado after retexcepMI;

end;

