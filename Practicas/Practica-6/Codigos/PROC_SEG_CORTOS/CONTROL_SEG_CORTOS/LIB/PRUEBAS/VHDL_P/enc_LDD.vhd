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
mgNNZag+SZmtBt8aAyy20n0SZ8jKg5svabIPFZbD3cAiC40xU5uqUMh3DkT7bFDP
aU3a/YGyRR3tf3GeszZA3cTyegefWVlIAZBgAQMB91WjAleLlrsxVdP/MNh8bZi5
Lz+ZXxXORXXAvFoG4UPbxT832F7Vky7wxEJvvQz5L4U=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 489)

`protect DATA_BLOCK
4ZpCWWMnHo45bRvz3dOvv1uztqgFiDk+CWwSc0+sz027sgYMpGXSOZ8lAquCQVNB
Qxc8zpM+FB1NMbkC//+pKoo9dzE8KYQB5dRX90NXLMinr+/c8/QVxpaDiI4I0h6M
N7Z65HWWlpte4A1GRbujI4A+BQW2n86FNKHvGX2m+4Buiy1JwH0XHMb12Ru3dKni
L/P4VSXYYfuq8XK/XREI4GETBJiVN+H0rvCPvKdKD2JVL4zqfUPL8Mc/n2m47TfU
x8OJJqBfAXzCE8N/lZalotfvH5woarTC6+pn17stzEGSICWXIqcmzitHdqRDEhwf
x+S/H9VyFg+P+bURBe8OlLTBpxSnllyHp1wBdT6rRjIzWyiqnFaEKH/SSNoOS+cW
7OF+dbVEUFVqf5A4hxtqfUdI/6bKNeX63TzP8+FHHneA/nlT1uVQxuZ+tVuH6RSs
HAF509UaiRiLF/QbuFw5YBDFkupChLVOn0zeNMTk++q0BWQ7VH5zGRQt8G2iqDDm
WrOTYShXn4Vm5XIhXvkOomela1hln5dBjsmSpn4RHACEUmPC9GvERLBLVMww9CNp
gJYFsWaLI4I2wnubSkGEroPzqmWsXW9e0GjDaOlLoTaP1ywsm/7Y2xTop6w/bil/
9TKmuLaENr5G8tPhqyhaMqDmpMjtiQaD5KAUc4MIKI8=
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

