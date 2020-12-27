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

entity acceso_MD is
	port (direccion: in tipo_direc_inst;	-- deteccion de direccion fuera de rango o no alineada
		opMD: in st_opMD;
		MD_FR: out std_logic;			-- 16 bits mas significativos deben ser como maximo x"0000"
		MD_NA: out std_logic);			-- direccion no alineada
end acceso_MD;

architecture comport of acceso_MD is

    function To_Std_Logic(L: BOOLEAN) return std_ulogic is 
    begin 
        if L then 
            return('1'); 
        else 
            return('0'); 
        end if; 
    end function To_Std_Logic; 

constant minval310: std_logic_vector(tam_direcc-1 downto 0):= x"10000000";
constant maxval310: std_logic_vector(tam_direcc-1 downto 0):= x"10001000";

constant cer10: std_logic_vector(1 downto 0):= (others =>'0');

constant t1bytes: integer := 0;				-- byte
constant t2bytes: integer := 1;				-- media aplabra
constant t4bytes: integer := 2;				-- palabra

signal dir2bits: std_logic_vector(1 downto 0);

signal fuera_rango: std_logic;
signal no_alineado: std_logic;
signal excep: std_logic_vector(1 downto 0);
signal seleccion: std_logic_vector(2 downto 0);

signal t_no_alineado: std_logic;
signal menordirmin, mayordirmax: std_logic;
signal t_fuera_rango: std_logic;

begin

	menordirmin <= To_Std_Logic(direccion(tam_direcc-1 downto 0) < minval310);
	mayordirmax <= To_Std_Logic(direccion(tam_direcc-1 downto 0) >= maxval310);
	t_fuera_rango <= menordirmin or mayordirmax;

	dir2bits <= direccion(1 downto 0);

dir_alineada: process(dir2bits, opMD)						-- comprobacion de que la direccion
variable ccontrol: integer;									-- esta alineada ( bits de menor ponderacion)
variable vdirdNA: std_logic;

begin
   
	vdirdNA := '0';
	ccontrol := to_integer(unsigned(opMD(1 downto 0)));			-- tamanyo del acceso
	case ccontrol is 
		when t4bytes =>
			case dir2bits is 
				when "01" | "10" | "11" =>					-- no alineada a palabra
						vdirdNA := '1';						-- 1, 2, 3
				when others => vdirdNA := '0'; 
 			end case;
		when t2bytes =>
			case dir2bits is 
				when "00" | "10" =>								-- no alineada a 2 bytes
						vdirdNA := '0';						-- 0
				when others => vdirdNA := '1';
			end case;
		when t1bytes => vdirdNA := '0';
		when others  => vdirdNA := '1';
	end case; 
	t_no_alineado <= vdirdNA;		  
end process;

MD_NA <= t_no_alineado and opMD(4) after retexcepMD; -- acceso a memoria: opMD(4)
MD_FR <= t_fuera_rango and opMD(4) after retexcepMD;

end;

