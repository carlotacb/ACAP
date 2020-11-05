--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.cte_tipos_bcd_pkg.all;
use work.componentes_compresion_pkg.all;

entity sAlgeDPD is
port ( a: in st_DPD; 
	b: in st_DPD; 
	sumres: in std_logic;
	s: out st_DPD; 
	irre: out std_logic);
end sAlgeDPD;

architecture estructural of sAlgeDPD is

signal aBCD, bBCD: st_ndig_bcd_mas_1; -- operandos A y B descomprimidos
signal sBCD: st_ndig_bcd_mas_1; -- resultado descomprimido de la suma 

begin
-- instantacion de los modulos descompresores (DPDaBCD) de los operandos mediante sentencias generate


--	aBCD(aBCD'left) <= a(a'left); -- bits mas significativos
--	bBCD(bBCD'left) <= b(b'left);

-- instantacion del sumador algebraico BCD (sAlgeBCD)

-- instantacion de los modulos compresores (BCDaDPD) del resultado de la suma mediante sentencias generate

	s <= (others => '0');
	irre <= '0';
end estructural;

