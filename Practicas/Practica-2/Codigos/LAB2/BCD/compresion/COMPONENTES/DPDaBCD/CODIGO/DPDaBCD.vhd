--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.retardos_bcd_compresion_pkg.all;

entity DPDaBCD is
port(en: in std_logic_vector(9 downto 0);
	sa: out std_logic_vector(11 downto 0) );
end DPDaBCD;

architecture compor of DPDaBCD is

-- BCD
alias a : std_logic is sa(11);
alias b : std_logic is sa(10);
alias c : std_logic is sa(9);
alias d : std_logic is sa(8);

alias e : std_logic is sa(7);
alias f : std_logic is sa(6);
alias g : std_logic is sa(5);
alias h : std_logic is sa(4);

alias i : std_logic is sa(3);
alias j : std_logic is sa(2);
alias k : std_logic is sa(1);
alias m : std_logic is sa(0);

-- DPD
alias p : std_logic is en(9);
alias q : std_logic is en(8);
alias r : std_logic is en(7);

alias s : std_logic is en(6);
alias t : std_logic is en(5);
alias u : std_logic is en(4);

alias v : std_logic is en(3);

alias w : std_logic is en(2);
alias x : std_logic is en(1);
alias y : std_logic is en(0);

signal nx, ns, nv, nw, nt: std_logic;

begin
nx <= not x;
ns <= not s;
nv <= not v;
nw <= not w;
nt <= not t;


a <= (v and w and nx) or (v and w and ns) or (v and w and s and t) after retDPDaBCD;
b <= (p and nv) or (p and nw) or (p and x and s and nt) after retDPDaBCD;
c <= (q and nv) or (q and nw) or (q and x and s and nt) after retDPDaBCD;
d <= r;
e <= (v and nw and x) or (v and w and x and nt) or (v and w and x and s) after retDPDaBCD;
f <= (s and nv) or (s and v and nx) or (p and v and w and x and ns and t) after retDPDaBCD;
g <= (t and nv) or (t and v and nx) or (q and v and w and x and ns and t) after retDPDaBCD;
h <= u;
i <= (v and nw and nx) or (v and w and x and s) or (v and w and x and t) after retDPDaBCD;
j <= (nv and w) or (s and v and nw and x) or (p and v and w and nx) or (p and v and w and x and ns and nt) after retDPDaBCD;
k <= (nv and x) or (t and v and nw and x) or (q and v and w and nx) or (q and v and w and x and ns and nt) after retDPDaBCD;
m <= y;

end compor;
