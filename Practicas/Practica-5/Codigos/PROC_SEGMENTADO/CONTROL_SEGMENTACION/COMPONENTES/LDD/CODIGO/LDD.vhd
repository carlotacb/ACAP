--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LDD is
	port(IDL1, IDL2 : in dir_reg; 
		valIDL1, valIDL2 : in std_logic;
		rdA, rdM, rdF, rdE : in dir_reg; 
		PBRA, PBRM, PBRF, PBRE : in st_PBR;
		IDL1A, IDL1M, IDL1F, IDL1E: out std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: out std_logic);
end LDD;


architecture estructural of LDD is

--SIGNALS
type t_regF is array (0 to 1) of dir_reg;
signal regF: t_regf;
type t_regDest is array (0 to 3) of dir_reg;
signal regDest: t_regDest;

type vec_b4 is array (0 to 3) of std_logic;
signal PBR: vec_b4;

type vec_b2 is array (0 to 1) of std_logic;
signal c_zeros: vec_b2; --PARA IDL1 y IDL2
signal Val: vec_b2; -- PARA VALIDL1 y VALIDL2

--type mat_Res is array (0 to 1, 0 to 3) of std_logic;
type tip_reg is array (0 to 7) of std_logic;

signal regIguales: tip_reg;
signal res: tip_reg;

begin
--UTILIZANDO GENERATE
regF <= (0 => IDL1, 1 => IDL2); --PRIMERO COMPRUEBA DE IDL1 despues de IDL2
Val <= (0 => VALIDL1, 1=> VALIDL2);
PBR <= (0 => PBRA, 1 => PBRM, 2 => PBRF, 3 => PBRE);
regDest <= (0 => rdA, 1 => rdM, 2 => rdF, 3 => rdE); 


LDD_gen: for i in 0 to 1 generate
	--Comprobamos antes si algun IDLx vale 0
	cmpZero: cmp port map(a => regF(i), b => (others => '0'), ig => c_zeros(i));

	Etapas: for j in 0 to 3 generate
		cmpReg: cmp port map (a=>regF(i), b=>regDest(j), ig => regIguales((4*i)+j));

		res((4*i)+j) <= ((not c_zeros(i)) and regIguales((4*i)+j) and Val(i) and PBR(j));

	end generate Etapas;

end generate LDD_gen;

--RESULTADOS
	IDL1A <= res(0) after retLDD;
	IDL1M <= res(1) after retLDD;
	IDL1F <= res(2) after retLDD;
	IDL1E <= res(3) after retLDD;
	IDL2A <= res(4) after retLDD;
	IDL2M <= res(5) after retLDD;
	IDL2F <= res(6) after retLDD;
	IDL2E <= res(7) after retLDD;
	
end estructural;
