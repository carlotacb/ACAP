--
-- Copyright (c) 2018, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.param_disenyo_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;
use work.riscv32_coop_funct_pkg.all;

entity deco_excep is 
  port (instruc: in tipo_inst_busq; 
	  CoErr: out std_logic);			
end deco_excep;

architecture comportamiento of deco_excep is

begin

decoerror:	process(instruc)
variable coop: codigooper;
variable funct3: campofunct3;
variable funct7: campofunct7;

constant funct3cero: campofunct3:= (others => '0');

begin
	coop:= instruc(6 downto 0);
	funct3:= instruc(14 downto 12);
	funct7:= instruc(31 downto 25);

	CoErr <='0';

	case coop is
		when COOP_LUI | COOP_AUIPC | COOP_JAL =>

		when COOP_JALR =>
			if funct3 /= funct3cero then
				CoErr <='1';
			end if;

		when COOP_BRANCH =>
			case funct3 is
				when COND_BEQ | COND_BNE | COND_BLT | COND_BGE | COND_BLTU | COND_BGEU =>

				when others => 
					CoErr <= '1';
			end case;

		when COOP_LOAD =>
			case funct3 is
				when LOAD_B | LOAD_H | LOAD_W | LOAD_BU | LOAD_HU =>

				when others => 
					CoErr <= '1';
			end case;

		when COOP_STORE =>
			case funct3 is
				when STORE_B | STORE_H | STORE_W =>

				when others => 
					CoErr <= '1';
			end case;

		when COOP_REG_IMM =>
			case funct3 is
				when F3_ADD_SUB | F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>

			    when F3_SR_LA =>
					case funct7 is
						when F7_SRAI | F7_RESTO =>
							
						when others =>  
							CoErr <= '1';
					end case;
				when others => 
					CoErr <= '1';
			end case; 

		when COOP_REG_REG =>
			case funct3 is
				when F3_ADD_SUB | F3_SR_LA =>
					case funct7 is 
						when F7_SUB | F7_RESTO => 
							
						when others => 
							CoErr <= '1';
					end case;
				when F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
					case funct7 is 
						when F7_RESTO =>
							
						when others => 
							CoErr <= '1';
					end case;
				when others =>
					CoErr <= '1';
			end case;

		when COOP_FENCE =>
			CoErr <= '1';

		when COOP_SYS =>
			CoErr <= '1';

		when others => 
			CoErr <= '1';

	end case;

end process;

end;

