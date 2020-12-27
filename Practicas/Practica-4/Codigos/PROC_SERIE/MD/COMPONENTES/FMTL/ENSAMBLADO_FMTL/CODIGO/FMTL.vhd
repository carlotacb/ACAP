
library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.retardos_pkg.all;
use work.componentes_MD_pkg.all;

entity FMTL is
port(ent: in tam_dat_camino_MD; 
	dirbyte: in dir_bytes_contenedor;
	opMD: in st_opMD;
	sal: out tam_dat_camino_MD);
end FMTL;

architecture estructural of FMTL is

signal signos: std_logic_vector (num_bytes_contenedor-1 downto 0);
signal alineado: tam_dat_camino_MD;
signal s: std_logic;
signal t_sal: tam_dat_camino_MD;

begin

alina: alinear port map(ent => ent, dirbyte => dirbyte, sal => alineado);

signos <= ent(31) & ent(23) & ent(15) & ent(7);

sel_sig: FMTL_sel_signo port map(d => signos, sel => dirbyte, opMD => opMD, s => s);

ext_sig: FMTL_extsig port map(signo => s, d0 => alineado, opMD => opMD, sal => t_sal);

sal <= t_sal after retFMTL;
end; 


