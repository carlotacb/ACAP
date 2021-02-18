--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.param_disenyo_pkg.all;
use work.RegDes_pkg.all;

entity latproh_v is 
  port (reloj, Pcero, I: std_logic;
		inst_latph: in std_logic;
		latphA: out std_logic;
		latphM: out std_logic);
end latproh_v;

architecture estructural of latproh_v is
signal inst_latph_RA4: std_logic;

begin
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
UTMVo0DKQQQ4Qx0HkKvGGspc4Vjq43tzgcOBZz90cln8ytgkcX032IcHw1R7xExt
bb4bvJowQlK7gn3LdiDYn28XsCOz3GXq50+KfvsU9IYmBoFY/209F3ebqwihCBlf
p36sCBi8OXlLo+E9bQZI0KpU7ehyceI9sER8SaCbbeE=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 226)

`protect DATA_BLOCK
ZgfCOTlgP70oyqOw4VV/kHhSedVoqGFvt+J22I7CqGopD9nqfccC4pOlunTOe6CI
O185oDBIvW74LfdcRkYn1whiYLHd1WPkyoBlAOxVLDtvCXGusFFrQiCf+eesOM8k
mY/H76hOz2gL6834r6aJB4tl8T/7EYK+XTtM6SKpsBbwCo3Yb5qAnFmDaHDUUl56
6L5sHrxuaJXV4qJvRqEGlAx40glgSDYMh3Wv4ueSE3JsgUXAXVf7FvG6vwobS1jU
XSKHJl1O5UwInw22x2A/PyAKP7kyDaZi3rL7sXaFn0IhdiK2cX92kWvpz/BcyMLY
siyLx8y+X6MwZeUMXU63vQ==
`protect END_PROTECTED
end;
