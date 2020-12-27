--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.tipos_constan_memoria_pkg.all;
use work.Rcomponentes_MI_pkg.all;
--! @image html RMI_blo_iny.png

entity Rcam_MEM_INST_INY_Pcero is
    port (reloj, Pcero: in std_logic;
			CP, proxCP: in tipo_direc_inst;
			bloqCP, inyecBDL: in std_logic;
			instr:	out tipo_inst_busq);
end Rcam_MEM_INST_INY_Pcero;

architecture estructural of Rcam_MEM_INST_INY_Pcero is
constant cero: tipo_direc_inst := (others => '0');
constant Inst_nop: tipo_inst_busq := x"00000013";

signal CP_MI_1, CP_MI: tipo_direc_inst;
signal instr_1: tipo_inst_busq;

begin

mux_inst: muxIns port map (d0 => proxCP, d1 => CP, SEL => bloqCP, s => CP_MI_1);
mux_pcero: muxIns port map (d0 => CP_MI_1, d1 => cero, SEL => Pcero, s => CP_MI);
Mem_INSTR: Rcam_MEM_INST port map(reloj => reloj, direc_MI => CP_MI, sal_MI => instr_1);
mux_bus: muxIns port map (d0 => instr_1, d1 => Inst_nop, SEL => inyecBDL, s => instr);

end;

