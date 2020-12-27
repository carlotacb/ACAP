--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

package componentes_secuenciamiento_pkg is

component cuatro is 
	port(tamI: out	tipo_direc_inst);
end component;

component FMTS is
	port(instr:	in  tipo_inst_busq;
		inmS:	in st_fmtS;
		inmediato: out tam_dat_camino);
end component;

component sumador is 
	port(a, b: in tipo_direc_inst;
		s: out tipo_direc_inst);
end component;

component sum_secu is 
	port(a, b: in tipo_direc_inst;
		sel: in st_mSI;
		s: out tipo_direc_inst);
end component;

component muxdirec is
generic (sel1: st_mSIC := mSIC_IMPL; sel2: st_mSIC := mSIC_MOD);
   port (d0, d1: in tipo_direc_inst;
	SEL: in st_mSIC;
	s: out tipo_direc_inst);
end component;

component eval is
	port(L1, L2:	in  tam_dat_camino;
		ig, me, meu:	out std_logic );
end component;

component DECS is
	port(opSEC:	in  st_opSEC;
		ig, me, meu:	in  std_logic;
		mSIC: out st_mSIC);
end component;

component acceso_MI is
	port (direccion: in tipo_direc_inst;	-- deteccion de direccion fuera de rango o no alineada
		MI_FR: out std_logic;			-- 16 bits mas significativos deben ser como maximo x"0000"
		MI_NA: out std_logic);			-- direccion no alineada
end component;

component camino_secuen is
	port(CP:	in tipo_direc_inst;
		instr:	in tipo_inst_busq;
		inmS:	in st_fmtS;
		mSI:	in st_mSI;
		L1, L2:	in tam_dat_camino;
		mSIC: in st_mSIC;
		ig, me, meu: out std_logic;
		CP_impli: out tipo_direc_inst;
		proxCP:	out tipo_direc_inst;
		MI_FR: out std_logic;
		MI_NA: out std_logic);
end component;

end package componentes_secuenciamiento_pkg;

