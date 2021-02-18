--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_control_seg_C_pkg is

component LDRD_C is
	port(IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		latphA: in std_logic;
		latphM: in std_logic;
		RD : out std_logic);
end component;

component LDC is
	port(reloj, Pcero: std_logic;
		IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic);
end component;

component inst_latproh is 
  port (instruc: in tipo_inst_busq; 
		inst_latph: out std_logic);
end component;

component latproh is 
  port (reloj, Pcero, I: std_logic;
		inst_latph: in std_logic; 
		latphA: out std_logic;
		latphM: out std_logic);
end component;

component ensam_RD_C is
	port(reloj, pcero, I : in std_logic;
		instruc: in tipo_inst_busq;
		PBR : in std_logic;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		RID: out std_logic);
end component;

component LIB_C is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

end package componentes_control_seg_C_pkg;

