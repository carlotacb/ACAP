--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.all;

-- La especificacion del componente en VHDL está en otro fichero
-- Los componentes se conectan mediante señales

entity S4bits is
generic(ret_xor: time := 15 ns;
    ret_and: time := 10 ns;
    ret_or: time := 15 ns);
port (A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    cen: in    std_logic;
    SUM: out std_logic_vector(3 downto 0);
    csal: out std_logic);
end S4bits;

architecture estructural of S4bits is
-- componentes y senyales

component S1bit
port (x, y, cen : in std_logic; s, csal : out std_logic);
end component;

signal c1, c2, c3, c4: std_logic;

begin
S1bit0: S1bit port map(x=>A(0), y=>B(0), cen=>cen, csal=>c1, s=>SUM(0));
S1bit1: S1bit port map(x=>A(1), y=>B(1), cen=>c1, csal=>c2, s=>SUM(1));
S1bit2: S1bit port map(x=>A(2), y=>B(2), cen=>c2, csal=>c3, s=>SUM(2));
S1bit3: S1bit port map(x=>A(3), y=>B(3), cen=>c3, csal=>c4, s=>SUM(3));
csal <= c4;
end estructural;