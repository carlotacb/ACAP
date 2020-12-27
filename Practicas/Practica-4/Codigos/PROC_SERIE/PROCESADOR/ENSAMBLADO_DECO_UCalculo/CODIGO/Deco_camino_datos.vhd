library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
--use work.retardos.all;
use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_cam_datos_pkg.all;
use work.componentes_decodificador_pkg.all;

entity Deco_camino_datos is
    port (reloj: std_logic;
--			Pcero: in std_logic;

--			dirdNA: in std_logic;
--			dirINA: in std_logic;
--			dirDErr: in std_logic;
--			dirIErr: in std_logic;

			instr:	in tipo_inst_busq;
			CP:		in tipo_direc_inst;
			mD_mES:	in tam_dat_camino;
			Secu_mES:	in tam_dat_camino;
			L1:		out tam_dat_camino;
			alu_dir: out tam_dat_camino;
			L2:		out tam_dat_camino;
			CoErr: out std_logic);
--			mES_BR: out tam_dat_camino);
--			CoErr: out std_logic;
--			parar: out std_logic );	
end Deco_camino_datos;

architecture estructural of Deco_camino_datos is

signal fmtS: st_fmtS;
signal MSI: st_MSI;
signal PBR: st_PBR;
signal inmD: st_fmtD;
signal DE: tam_dat_camino;
signal mL1: st_mL1;
signal mL2: st_mL2;
signal opALU: st_opALU;
signal opMD: st_opMD;
signal opSEC: st_opSEC;
signal mES: st_MES;

signal t_mES_BR: tam_dat_camino;

alias IDE: dir_reg is instr(11 downto 7);
alias IDL2: dir_reg is instr(24 downto 20);
alias IDL1: dir_reg is instr(19 downto 15);

begin 

deco: decodificador port map (instruc => instr, 
--						Pcero => Pcero, 
--						dirdNA => dirdNA, dirINA => dirINA, dirDErr => dirDErr, dirIErr => dirIErr,
						fmtS => fmtS, MSI => MSI, PBR => PBR, fmtD => inmD, mL1 => mL1, mL2 => mL2, mES => mES,
						opALU => opALU, opMD => opMD, opSEC => opSEC, CoErr => CoErr);
--						, parar => parar);

cam_datos: camino_datos port map (reloj => reloj, instr => instr, 
--								IDL1 => IDL1, IDL2 => IDL2, IDE => IDE, 
								CP => CP, inmD => inmD, DE => DE, MD_mES => mD_mES, Secu_mES => Secu_mES,
								PBR => PBR, mL1 => mL1, mL2 => mL2, opALU => opALU, mES => mES, L1 => L1, L2 => L2, alu_dir => alu_dir, mES_BR => DE); --mES_BR => t_mES_BR);

--DE <= t_mES_BR;

end;
