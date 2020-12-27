--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_decodificador_pkg is

component decocamino is 
  port (instruc: in tipo_inst_busq; 
		fmtS : out st_fmtS;
		MSI : out st_mSI;
		PBR: out st_PBR;
		fmtD: out st_fmtD;
		mL1: out st_mL1;
		mL2: out st_mL2;
		mES: out st_mES);
end component;

component decoopALU is 
  port (instruc: in tipo_inst_busq; 
		opALU: out st_opALU);
end component;

component decoopMD is 
  port (instruc: in tipo_inst_busq; 
		opMD: out st_opMD);
end component;

component decoopSEC is 
  port (instruc: in tipo_inst_busq; 
		opSEC: out st_opSEC);
end component;

component decodificador is 
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
end component;

component deco_excep is 
  port (instruc: in tipo_inst_busq; 
	  CoErr: out std_logic);			
end component;

end package componentes_decodificador_pkg;
