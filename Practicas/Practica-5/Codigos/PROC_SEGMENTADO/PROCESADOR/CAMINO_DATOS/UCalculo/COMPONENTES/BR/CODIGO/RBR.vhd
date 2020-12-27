--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.RegDes_pkg.all;
--! @image html RBR.png
 
entity RBR is
	port(reloj, pcero, B, I:	in std_logic;
		IDL1:	in dir_reg;				-- 2 puertos de lectura combinatorios
		IDL2:	in dir_reg;
		L1:		out tam_dat_camino;
		L2:		out tam_dat_camino;
		IDE:	in dir_reg;				-- 1 puerto de escritura sincrono
		DE:		in tam_dat_camino;
		PE:		in std_logic);
end RBR;

architecture compor of RBR is

signal IDL1_RDL3, IDL2_RDL3 : dir_reg; 
signal IDE_RDL3, IDE_RA4, IDE_RM5, IDE_R6: dir_reg;
signal PE_RDL3, PE_RA4, PE_RM5, PE_R6: std_logic;

begin

RDL3_IDL1: RDB_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, B => B, e => IDL1, s => IDL1_RDL3);

RDL3_IDL2: RDB_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, B => B, e => IDL2, s => IDL2_RDL3);

RDL3_IDE: RDB_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, B => B, e => IDE, s => IDE_RDL3);
RA4_IDE: RD_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, e => IDE_RDL3, s => IDE_RA4);
RM5_IDE: RD_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, e => IDE_RA4, s => IDE_RM5);
R6_IDE: RD_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, e => IDE_RM5, s => IDE_R6);

RA4_PE: RDI_1 port map (reloj => reloj, pcero => pcero, I => I, e => PE, s => PE_RA4);
RM5_PE: RD_1 port map (reloj => reloj, pcero => pcero, e => PE_RA4, s => PE_RM5);
R6_PE: RD_1 port map (reloj => reloj, pcero => pcero, e => PE_RM5, s => PE_R6);

R_BR: BR port map (reloj => reloj, IDL1 => IDL1_RDL3, IDL2 => IDL2_RDL3, L1 => L1, L2 => L2, IDE => IDE_R6, DE => DE, PE => PE_R6);

end;


