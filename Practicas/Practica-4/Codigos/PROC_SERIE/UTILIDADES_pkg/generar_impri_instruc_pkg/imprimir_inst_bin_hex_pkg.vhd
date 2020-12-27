--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;
use ieee.std_logic_textio.all;

use work.param_disenyo_pkg.all;

package imprimir_inst_bin_hex_pkg is

procedure imprimir_bin_hex (instruccion: in tipo_inst_busq; binario: in std_logic; hexa: in std_logic; l: inout line);

end package imprimir_inst_bin_hex_pkg;

package body imprimir_inst_bin_hex_pkg is

procedure imprimir_bin_hex (instruccion: in tipo_inst_busq; binario: in std_logic; hexa: in std_logic; l: inout line) is
begin
	if binario = '1' then
		write(l, instruccion, right, 32);
	end if;
	if binario = '1' and hexa = '1' then
		write(l, string'(" "));
	end if;
	if hexa = '1' then
		hwrite(l, instruccion, right, 8);
	end if;
end procedure imprimir_bin_hex;


end package body imprimir_inst_bin_hex_pkg;

