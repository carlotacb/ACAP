--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cte_tipos_deco_camino_pkg.all;
use work.componentes_control_seg_pkg.all;
use work.retardos_cntl_seg_pkg.all;

entity LGR_v is
	port(RID, RS : in std_logic;
		bloqCP, bloqBDL, inyecBDL, inyecDLA: out std_logic);
end LGR_v;


architecture estructural of LGR_v is

signal t_RS: std_logic;
begin
`protect BEGIN_PROTECTED
`protect version = 1
`protect encrypt_agent = "Model Technology", encrypt_agent_info = "10.1d"
`protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 128)
`protect KEY_BLOCK
C/HW8CpiUEjbMS6o6Q5bGR6wIneeOLLWjtgVsbUnnTwKCf/GfUSgaM6X/nxFOjfJ
OQIdK0LlVLQ10nK+hNqPaHcQn66onWANZHnXIOgcpHL5+UhqY4nKuADT4v4VXtOC
qAMyHB49jIDwJahR7l3HdKCxKYOvQhyjCSRdOYzg3tE=
`protect data_method = "aes128-cbc"
`protect encoding = (enctype = "base64", line_length = 64, bytes = 181)

`protect DATA_BLOCK
7UNQem1ObT97uFXsxlXwXXk+OU4vzqE5BEDZVb6zfqyHnQ9Bu2H4p9gIyoYb+qRu
rtPSr3+7Bh7uLNky5d1QL4i9tZOvNDEf6bklU2oeY74AqccadmLHvqocdFSwfvUi
sqwnWqxrURzguFhXTdHqjUzxxy6+tRgAzTj4jvhmEpdpWRIgKO61N8kF5pRbnMu3
53gAW4/aKFZ3WeJZbg/r7I0GmzD1tSRt7hA4fOobLbN1fK9LrlAWyrpBMj0lxWZb
YzeprcydyK16VQOWjoYQdw==
`protect END_PROTECTED	
end estructural;
