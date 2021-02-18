--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.cte_tipos_deco_camino_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_pkg.all;
use work.cte_tipos_deco_camino_ModSecu_relI_PreBra_pkg.all;

use work.param_disenyo_pkg.all;
use work.componentes_decodificador_ModSecu_relI_PreBra_pkg.all;

use work.RegDes_pkg.all;

entity Rdecodificador_ModSecu_relI_PreBra is 
  port (reloj, pcero, B: in std_logic;
		instruc: in tipo_inst_busq; 
		fmtS : out st_fmtS;
		MSI : out st_mSI;
		PBR: out st_PBR;
		fmtD: out st_fmtD;
		mL1: out st_mL1;
		mL2: out st_mL2 ;
		mES: out st_mES;
		mxrelI: out st_mrelI;
		opALU: out st_opALU;
		opMD: out st_opMD;
		opSEC: out st_opSEC;
		SCond: out st_SCond;
		CoErr: out std_logic);
end;

architecture estructural of Rdecodificador_ModSecu_relI_PreBra is
signal instruc_RDL: tipo_inst_busq;

begin

RDL3_instr: RDB_DL_N generic map (tam => tam_instruc) -- pcero, inyectar nop canonica
			port map (reloj => reloj, pcero => pcero, B => B, e => instruc, s => instruc_RDL);

R_deco: decodificador_ModSecu_relI_PreBra port map (instruc => instruc_RDL, 
                        fmtS => fmtS, MSI => MSI,
						PBR => PBR, fmtD => fmtD, mL1 => mL1, mL2 => mL2,
						mES => mES, mxrelI => mxrelI,
						opALU => opALU, opMD => opMD, opSEC => opSEC, SCond => SCond, CoErr => CoErr);

end;













