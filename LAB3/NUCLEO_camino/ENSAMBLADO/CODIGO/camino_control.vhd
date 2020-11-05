--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.cte_tipos_nucleo_pkg.all;
use work.componentes_nucleo_pkg.all;
--! @image html nucleo_camino.png 

entity camino_control is     
port(reloj: in std_logic;
	PEini, Pcero, ini: in std_logic;
	IDEini:in st_iden; 
	DEini: in st_datos; 
	IDL1ini:in st_iden; 
	finalop: out std_logic);
end camino_control;

architecture estructura of camino_control is

signal IDL1, IDL2, IDE, IDEBR, IDL1BR: st_iden; 
signal Le1, le2, DEsum, DEBR: st_datos; 
signal PE, PEBR, selec: std_logic;

begin

muxiniDE: multiplexor generic map(tam => tam_camino)
				port map(e0 => DEsum, e1 => DEini, selec => selec, sal => DEBR);
muxiniIDE: multiplexor generic map(tam => log_num_reg)
				port map(e0 => IDE, e1 => IDEini, selec => selec, sal => IDEBR);
mux1ini: multiplexor_1 port map(e0 => PE, e1 => PEini, selec => selec, sal => PEBR);

muxIDL: multiplexor generic map(tam => log_num_reg)
				port map(e0 => IDL1, e1 => IDL1ini, selec => selec, sal => IDL1BR);

bancoregistro: BR port map (reloj => reloj, PE => PEBR, IDL1 => IDL1BR, IDL2 => IDL2, IDE => IDEBR, DE => DEBR, Le1 => Le1, Le2 => Le2);
 
suma: sumador port map (a => Le1, b => Le2, s => DEsum);

controlDE: control port map(reloj => reloj, Pcero => Pcero, ini => ini, IDL1 => IDL1, IDL2 => IDL2, IDE => IDE, finalop => finalop, selec => selec, PE => PE);
 

end;

