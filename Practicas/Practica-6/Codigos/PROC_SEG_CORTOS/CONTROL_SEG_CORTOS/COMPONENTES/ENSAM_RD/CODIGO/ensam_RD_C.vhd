--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.componentes_control_seg_C_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity ensam_RD_C is
	port(reloj, pcero, I : in std_logic;
		instruc: in tipo_inst_busq;
		PBR : in st_PBR;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		RID: out std_logic);
end ensam_RD_C;


architecture estructural of ensam_RD_C is

signal valIDL1, valIDL2: std_logic;

signal rdA, rdM, rdF, rdE:  dir_reg; 
signal PBRA, PBRM, PBRF, PBRE: st_PBR;

signal IDL1A, IDL1M, IDL1F, IDL1E: std_logic;
signal IDL2A, IDL2M, IDL2F, IDL2E: std_logic;

alias rd: dir_reg is instruc(11 downto 7);
alias IDL2: dir_reg is instruc(24 downto 20);
alias IDL1: dir_reg is instruc(19 downto 15);

signal inst_latph, latphA, latphM: std_logic;

begin
	
senyales_cntl: senya_cntlRD port map(reloj => reloj, pcero => pcero, I => I, rd => rd, PBR => PBR,
									rdA => rdA, rdM => rdM, rdF => rdf, rdE => rdE, PBRA => PBRA, PBRM => PBRM, PBRF => PBRF, PBRE => PBRE);

genvalreg: valreg port map (instruc => instruc, valIDL1 => valIDL1, valIDL2 => valIDL2);

LDDat: LDD port map(IDL1 => IDL1, IDL2 => IDL2, valIDL1 => valIDL1, valIDL2 => valIDL2, rdA => rdA, rdM => rdM, rdF => rdF, rdE => rdE, 
						PBRA => PBRA, PBRM => PBRM, PBRF => PBRF, PBRE => PBRE, IDL1A => IDL1A, IDL1M => IDL1M, IDL1F => IDL1F, IDL1E => IDL1E,
						 IDL2A => IDL2A, IDL2M => IDL2M, IDL2F => IDL2F, IDL2E => IDL2E);

ins_laph: inst_latproh port map (instruc => instruc, inst_latph => inst_latph);

pos_laph: latproh port map(reloj => reloj, pcero => pcero, I => I, inst_latph => inst_latph, latphA => latphA, latphM => latphM);

R_dat: LDRD_C port map (IDL1A => IDL1A, IDL1M => IDL1M, IDL1F => IDL1F, IDL1E => IDL1E, IDL2A => IDL2A, IDL2M => IDL2M, IDL2F => IDL2F, IDL2E => IDL2E, latphA => latphA, latphM => latphM, RD => RID);

cortos: LDC port map(reloj => reloj, pcero => pcero, IDL1A => IDL1A, IDL1M => IDL1M, IDL1F => IDL1F, IDL1E => IDL1E, IDL2A => IDL2A, IDL2M => IDL2M, IDL2F => IDL2F, IDL2E => IDL2E,
					C1L1 => C1L1, C2L1 => C2L1, C3L1 => C3L1, C4L1 => C4L1, C1L2 => C1L2, C2L2 => C2L2, C3L2 => C3L2, C4L2 => C4L2);


end estructural;
