library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_secuenciamiento_pkg.all;
use work.RegDes_pkg.all;

entity Rmuxdirec_C_ModSecu is
generic (sel1: st_mSIC := mSIC_IMPL; sel2: st_mSIC := mSIC_MOD);
   port (reloj, pcero, I: in std_logic;
	d0, d1: in tipo_direc_inst;
	SEL: in st_mSIC;
	s: out tipo_direc_inst);
end Rmuxdirec_C_ModSecu;

architecture comportamiento of Rmuxdirec_C_ModSecu is
signal d0_RA4: tipo_direc_inst;
signal SEL_RA4: st_mSIC;

begin

RA4_mSI: RDI_1 port map (reloj => reloj, pcero => pcero, I => I, e => SEL, s => SEL_RA4);

RA4_d0: RD_N generic map (tam => tam_dat)
			port map (reloj => reloj, pcero => pcero, e => d0, s => d0_RA4);

R_mSI: muxdirec generic map (sel1 => mSIC_IMPL, sel2 => mSIC_MOD)
				port map (d0 => d0_RA4, d1 => d1, SEL => SEL_RA4, s => s);
end comportamiento;
