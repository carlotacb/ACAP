--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_bcd_compresion_pkg.all;

entity BCDaDPD is
port(en: in std_logic_vector(11 downto 0);
	sa: out std_logic_vector(9 downto 0) );
end BCDaDPD;

architecture compor of BCDaDPD is

-- BCD
alias a : std_logic is en(11);
alias b : std_logic is en(10);
alias c : std_logic is en(9);
alias d : std_logic is en(8);

alias e : std_logic is en(7);
alias f : std_logic is en(6);
alias g : std_logic is en(5);
alias h : std_logic is en(4);

alias i : std_logic is en(3);
alias j : std_logic is en(2);
alias k : std_logic is en(1);
alias m : std_logic is en(0);

-- DPD
alias p : std_logic is sa(9);
alias q : std_logic is sa(8);
alias r : std_logic is sa(7);

alias s : std_logic is sa(6);
alias t : std_logic is sa(5);
alias u : std_logic is sa(4);

alias v : std_logic is sa(3);

alias w : std_logic is sa(2);
alias x : std_logic is sa(1);
alias y : std_logic is sa(0);

signal na, ni, ne: std_logic;

begin
na <= not a after retBCDaDPD;
ni <= not i after retBCDaDPD;
ne <= not e after retBCDaDPD;

p <= (na and b) or (a and ni and j) or (a and ne and f and i) after retBCDaDPD;
q <= (na and c) or (a and ni and k) or (a and ne and g and i) after retBCDaDPD;
r <= d;
s <= (na and ne and f) or (ne and ni and f) or (na and e and ni and j) or (e and i) after retBCDaDPD;
t <= (na and ne and g) or (ne and ni and g) or (na and e and ni and k) or (a and i) after retBCDaDPD;
u <= h after retBCDaDPD;
v <= a or e or i after retBCDaDPD;
w <= a or (e and i) or (ne and ni and j) after retBCDaDPD;
x <= e or (a and i) or (na and ni and k) after retBCDaDPD;
y <= m;

end compor;
