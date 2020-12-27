--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.param_disenyo_pkg.all;
use work.retardos_pkg.all;
use work.componentes_decodificador_pkg.all;
--! @image html Decodificador1.png
--! @image html Decodificador2.png

entity decodificador is 
  port (instruc: in tipo_inst_busq; 
		fmtS : out st_fmtS;
		MSI : out st_mSI;
		PBR: out st_PBR;
		fmtD: out st_fmtD;
		mL1: out st_mL1;
		mL2: out st_mL2 ;
		mES: out st_mES;
		opALU: out st_opALU;
		opMD: out st_opMD;
		opSEC: out st_opSEC;
		CoErr: out std_logic);
end;

architecture estructural of decodificador is

signal s_fmtS: st_fmtS;
signal s_MSI: st_mSI;
signal s_PBR: st_PBR;
signal s_fmtD: st_fmtD;
signal s_mL1: st_mL1;
signal s_mL2: st_mL2;
signal s_mES: st_mES;

signal s_opALU: st_opALU;
signal s_opMD: st_opMD;
signal s_opSEC: st_opSEC;
signal s_CoErr: std_logic;

begin

camino: decocamino port map (instruc => instruc, 
					fmtS => s_fmtS, MSI => s_MSI, PBR => s_PBR, fmtD => s_fmtD, mL1 => s_mL1, mL2 => s_mL2, mES => s_mES);

ALU: decoopALU port map (instruc => instruc, opALU => s_opALU);

MEMORIA: decoopMD port map (instruc => instruc, opMD => s_opMD);

SECUEN: decoopSEC port map (instruc => instruc, opSEC => s_opSEC);

Inst_ERR: deco_excep port map(instruc => instruc, CoErr => s_CoErr);

fmtS <= s_fmtS after retDECO;
MSI <= s_MSI after retDECO;

PBR <= s_PBR after retDECO;
fmtD <= s_fmtD after retDECO;
mL1 <= s_mL1 after retDECO;
mL2 <= s_mL2 after retDECO;
            
mES <= s_mES after retDECO;

opALU <= s_opALU after retDECO;
opMD <= s_opMD after retDECO;
opSEC <= s_opSEC after retDECO;
CoErr <= s_CoErr;

end;

