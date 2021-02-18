--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.RegDes_pkg.all;
use work.retardos_cntl_seg_C_pkg.all;

entity LDC_v is
	port(reloj, Pcero: std_logic;
		IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		C1L1, C2L1, C3L1, C4L1: out std_logic;
		C1L2, C2L2, C3L2, C4L2: out std_logic);
end LDC_v;

architecture estructural of LDC_v is

begin
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
mnrSnQ+w6m6hErqw51tqeEHEhQ4D5LdUAr//EbHil1JECBbzbe6glYbEI1AO4q9K
05OB/C1/xk8jrLB3pyTs3JRobyfkWk4i0vEAPeuKkErSqWD6JZXyCA7UzqffQdNX
GX3378zAfd3GFqpLyJKedqr4g7fA0dlXPIb3ZbHc0Ac=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 415)

`protect DATA_BLOCK
Y0QW/FXZ6/12nc94ncTRaYpPakcVHb3Z9ARHO9q5WfdKXAqJczweNu+jlNLYkCkV
fhqKWD3LeMbks/2KDxgvyEY/+qslgO7y2SIfCQMb+iNDdlFTR0hNT+CUnwEQhpO/
kl3JVzYaMoM0zey/4qYM3nqZancPqoqHa1ENv9AuMX1NFliCe6OeuGM4ICkJ+kKm
BmtVSjRzhc4K96T8BaLHs2LPKvY44iHtpEOfSr72ISH4ABbCX33vh/Sb4ZoJiEs1
QRMnE3dpHMvaeX8YCMOuYe+eiMEh4FypzQHGmlQ9pICq8YR1RGCZkEdJGTApvMDV
qOxLoqw7Z7Curqk5gMB3DfLsBEwB2xsinLlS+E+Kgf4iW4G7OXSfNi29rqz0fOCE
2E5E6lWYG4pG5k2v+zg87gzXXQGxTaUXkb47H6W9KdGU6PtxYfrv1I61LZJN69aZ
IkEoCtt+m7sZ45hUSxcRg0dDk1uxzQAxPKaKhWSbWjNN67+7M4a2T2BL5WoFNs7C
eVz1/p4BjUtWWK4EDVUCsqYVcTQsS159tCLi5K7cSastkGdWspgH+Seb2DEDLty0
`protect END_PROTECTED
end;
