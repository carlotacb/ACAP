--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.retardos_cntl_seg_pkg.all;
use work.RegDes_pkg.all;
--! @image html senyal_RD_LIB.png

entity senya_cntlRD is
	port(reloj, pcero, I : in std_logic;
		rd : in dir_reg; 
		PBR : in st_PBR;
		rdA, rdM, rdF, rdE : out dir_reg; 
		PBRA, PBRM, PBRF, PBRE : out std_logic);
end senya_cntlRD;


architecture estructural of senya_cntlRD is
signal t_rdA, t_rdM, t_rdF: dir_reg; 
signal t_PBRA, t_PBRM, t_PBRF: st_PBR;

begin

RDA4_rd: RDI_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, I => I, e => rd, s => t_rdA);
RDM5_rd: RD_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, e => t_rdA, s => t_rdM);
RD6_rd: RD_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, e => t_rdM, s => t_rdF);
RDE7_rd: RD_N generic map (tam => lognumReg)
			port map (reloj => reloj, pcero => pcero, e => t_rdF, s => rdE);
rdA <= t_rdA;
rdM <= t_rdM;
rdF <= t_rdF;

RDA4_pbr: RDI_1 port map (reloj => reloj, pcero => pcero, I => I, e => PBR, s => t_PBRA);
RDM5_pbr: RD_1 port map (reloj => reloj, pcero => pcero, e => t_PBRA, s => t_PBRM);
RD6_pbr: RD_1 port map (reloj => reloj, pcero => pcero, e => t_PBRM, s => t_PBRF);
RDE7_pbr: RD_1 port map (reloj => reloj, pcero => pcero, e => t_PBRF, s => PBRE);
PBRA <= t_PBRA;
PBRM <= t_PBRM;
PBRF <= t_PBRF;

end estructural;
