--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_control_seg_pkg is

component orv2 is 														
	port(a, b: in std_logic;
		s: out std_logic);
end component;

component andv2 is 														
	port(a, b: in std_logic;
		s: out std_logic);
end component;

component orvn is 														
	port(a, b, c, d, e, f: in std_logic;
		s: out std_logic);
end component;

component andv3 is 														
	port(a, b, c: in std_logic;
		s: out std_logic);
end component;

component andv1n is 														
	port(a, b: in std_logic;
		s: out std_logic);
end component;

component cmp is 									
generic(tam: natural := lognumReg);						
	port(a, b: in std_logic_vector(tam-1 downto 0);
		ig: out std_logic);
end component;

component valreg is 
  port (instruc: in tipo_inst_busq; 
		valIDL1, valIDL2: out std_logic);
end component;

component decoPBRopSEC is 
  port (instruc: in tipo_inst_busq; 
		PBR: out st_PBR;
		opSEC: out st_opSEC);
end component;

component RdecoPBRopSEC is 
  port (reloj, pcero, B: std_logic;
		instruc: in tipo_inst_busq; 
		instrucDL: out tipo_inst_busq; 
		PBRDL: out st_PBR;
		opSECDL: out st_opSEC);
end component;

component LDRD is
	port(IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		RD : out std_logic);
end component;

component LDRS is
	port(opsecDL, opsecA : in st_opSEC;
		RS: out std_logic);
end component;

component LDD is
	port(IDL1, IDL2 : in dir_reg;
		valIDL1, valIDL2 : in std_logic;
		rdA, rdM, rdF, rdE : in dir_reg;
		PBRA, PBRM, PBRF, PBRE : in std_logic;
		IDL1A, IDL1M, IDL1F, IDL1E: out std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: out std_logic);
end component;

component senya_cntlRD is
	port(reloj, pcero, I : in std_logic;
		rd : in dir_reg; 
		PBR : in std_logic;
		rdA, rdM, rdF, rdE : out dir_reg;
		PBRA, PBRM, PBRF, PBRE : out std_logic);
end component;

component ensam_RD is
	port(reloj, pcero, I : in std_logic;
		instruc: in tipo_inst_busq;
		PBR : in std_logic;
		RID: out std_logic);
end component;

component senya_cntlRS is
	port(reloj, pcero, I : in std_logic;
		opsec: in st_opSEC;
		opsecA : out st_opSEC);
end component;

component ensam_RS is
	port(reloj, pcero, I : in std_logic;
		opsec : in st_opSEC;
		RS : out std_logic);
end component;

component LGR is
	port(RID, RS : in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component LGR;

component LIB is
	port(reloj, pcero, B, I : in std_logic;
		instruc: in tipo_inst_busq;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end component;

end package componentes_control_seg_pkg;

