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

entity LDD_v is
	port(IDL1, IDL2 : in dir_reg; 
		valIDL1, valIDL2 : in std_logic;
		rdA, rdM, rdF, rdE : in dir_reg; 
		PBRA, PBRM, PBRF, PBRE : in st_PBR;
		IDL1A, IDL1M, IDL1F, IDL1E: out std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: out std_logic);
end LDD_v;


architecture estructural of LDD_v is

constant r0: dir_reg:= (others => '0');

type t_idreg is record
	reg: dir_reg;
	v: std_logic;
end record t_idreg;

type t_reg_font is array (1 to 2) of t_idreg;	-- L1 L2
type t_reg_dest is array (1 to 4) of t_idreg;	-- A M F E
signal reg_font: t_reg_font;
signal reg_dest: t_reg_dest;

type t_mat_dep is array (1 to 2, 1 to 4) of std_logic;
signal dep: t_mat_dep;

begin
	
	reg_font	<= (1 => (IDL1, valIDL1), 2 => (IDL2, valIDL2));
	reg_dest <= (1 => (rdA, PBRA), 2 => (rdM, PBRM), 3 => (rdF, PBRF), 4 => (rdE, PBRE)); 
	
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
lHkG3jrSbBc0iSxHECplfdwMq6g6CrKDCaTNSk4oncEdjh8dtf4Ghn+tgBBqM89X
HO1ODPsyGhBMw/1s6lnAjirApBCkFVwkhYj8GSDLuL4oSOxD0vxJ86JdN38Orttc
nzwpXhnKhH5h8pMrh3nckfD35VOWLTIQGbBt7UHksSs=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 489)

`protect DATA_BLOCK
oRxAO1tWOhpC55NszOb5SMdoSX79qcx7hMhs8VyOSmCsPXXG87W3yXXKpavQosJ2
vTxq4XBptv6QUFgakKUWcyl4FlWWT7BNKG40VGod1OE8JlxYAWdpxzW9HTVvcbpS
uB6xKPiRbuwFyqrb5tOudV4EMRJlBHZShWCiTm5T6pPnQ7Z/GyN/wu296LRs5Cw3
M3PFqeIeLp9VpbTW7ZN5kL2WCqMqR5bRQswJ3S1WYAn4oCMzytcTaIQefZfyVIyP
Z6kwKlxGBSHcPRKoZZ9ubUXlrelqB4QVPJXaTYtss9gN2xatIODUocdq/3dcV2K0
0l/Ooc+6VtBXwN8mShsB5io9KmKYQrAKU1A7S7Uy7Z3eo4zhiivRdP0O7ywf1PCs
Bs40GKuU/aYUASG9HlgoAQ995KdfFS8kMeD0f0YN9zdulAQ4fW+7FwoL8t4BUUUZ
R+7PUXBfjFUMdr6FXPXOKcELBx6ob2s1lQVVIc3B1CpQ7LLLk/+VhKov/vwQZqcG
9atKgW49wZFSZXbb2ccSng+dv8jeH2nMwi9bt2jEKlrbA7c3Bt9Z3nojcNXbr80B
2qTKmCMjzKoSrSP0j36PV2cgVJFUFUi7VjYq8tOb989KtCjELj4xkgA7B3//3hs7
VXD5Mxxey0/El4xf67ULh+sweFsvuatOfZJUMDsjF7Y=
`protect END_PROTECTED
-- sortides
	IDL1A <= dep(1,1) after retLDD;
	IDL1M <= dep(1,2) after retLDD;
	IDL1F <= dep(1,3) after retLDD;
	IDL1E <= dep(1,4) after retLDD;
	IDL2A <= dep(2,1) after retLDD;
	IDL2M <= dep(2,2) after retLDD;
	IDL2F <= dep(2,3) after retLDD;
	IDL2E <= dep(2,4) after retLDD;

end estructural;

