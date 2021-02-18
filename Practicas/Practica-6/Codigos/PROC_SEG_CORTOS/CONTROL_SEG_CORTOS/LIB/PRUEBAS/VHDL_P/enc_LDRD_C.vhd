--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_cntl_seg_C_pkg.all;

entity LDRD_C_v is
	port(IDL1A, IDL1M, IDL1F, IDL1E: in std_logic;
		IDL2A, IDL2M, IDL2F, IDL2E: in std_logic;
		latphA: in std_logic;
		latphM: in std_logic;
		RD : out std_logic);
end LDRD_C_v;


architecture estructural of LDRD_C_v is
begin
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
oCdbCsOooyMZwrrsExkT3YFyieqb5dykMeE+sJqOUvbEpatenR/nASAM06Gty6gZ
3zJ70i1bCtbuzDxqNwuEx6dmp5249/sQedTUD61obVu0VOszqeEqLKgJ/TT2FCE1
QcTVXZ1aL/mMAGQ95SqFzgXyflpRpSCw0hM7ISDzB6A=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 215)

`protect DATA_BLOCK
8AAFTtDG/nwbu+pALMGWkrj7EzWRaf2WWEoapyzw9t6r90blSiuwLBRZT1JzIFxq
iWc9xHUvWKWG9iNp3XnUBzuK6mo8HUpBjXSQHzSV/oODYLOeu5PJ1N69ZBvaeCTc
4+AS+6Tg2D5elf1k6b1ZbA+M1Pw3JNVmaXH6wzELBSR8uU7MjbkmuI/2dB3xUtKQ
40NP3AO/FcMKSMbiLrRQTQnzfsP5SyF3hN13438spCxqhRHFMiATk2yt6OrRdL2w
gSTxdV72387azT70LxJ2E6xjsxRFlDdZGC8UqmxnfxBa6Inuoi9LLtUIHCV7zpfJ
`protect END_PROTECTED
end estructural;
