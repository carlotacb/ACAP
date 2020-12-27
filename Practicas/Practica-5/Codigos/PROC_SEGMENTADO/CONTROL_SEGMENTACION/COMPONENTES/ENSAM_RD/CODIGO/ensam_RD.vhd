--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;
--! @image html ensam_RD.png

entity ensam_RD is
	port(reloj, pcero, I : in std_logic;
		instruc: in tipo_inst_busq;
		PBR : in st_PBR;
		RID: out std_logic);
end ensam_RD;


architecture estructural of ensam_RD is

signal valIDL1, valIDL2: std_logic;

signal rdA, rdM, rdF, rdE:  dir_reg; 
signal PBRA, PBRM, PBRF, PBRE: st_PBR;

signal IDL1A, IDL1M, IDL1F, IDL1E: std_logic;
signal IDL2A, IDL2M, IDL2F, IDL2E: std_logic;

alias rd: dir_reg is instruc(11 downto 7);
alias IDL2: dir_reg is instruc(24 downto 20);
alias IDL1: dir_reg is instruc(19 downto 15);

begin
	
	senyales_cntl: senya_cntlRD port map(reloj => reloj, pcero => pcero, I => I, rd => rd, PBR => PBR,
									rdA => rdA, rdM => rdM, rdF => rdf, rdE => rdE, PBRA => PBRA, PBRM => PBRM, PBRF => PBRF, PBRE => PBRE);

	genvalreg: valreg port map (instruc => instruc, valIDL1 => valIDL1, valIDL2 => valIDL2);

	LDDat: LDD port map(IDL1 => IDL1, IDL2 => IDL2, valIDL1 => valIDL1, valIDL2 => valIDL2, rdA => rdA, rdM => rdM, rdF => rdF, rdE => rdE, 
						PBRA => PBRA, PBRM => PBRM, PBRF => PBRF, PBRE => PBRE, IDL1A => IDL1A, IDL1M => IDL1M, IDL1F => IDL1F, IDL1E => IDL1E,
						 IDL2A => IDL2A, IDL2M => IDL2M, IDL2F => IDL2F, IDL2E => IDL2E);

	R_dat: LDRD port map (IDL1A => IDL1A, IDL1M => IDL1M, IDL1F => IDL1F, IDL1E => IDL1E, IDL2A => IDL2A, IDL2M => IDL2M, IDL2F => IDL2F, IDL2E => IDL2E, RD => RID);


end estructural;