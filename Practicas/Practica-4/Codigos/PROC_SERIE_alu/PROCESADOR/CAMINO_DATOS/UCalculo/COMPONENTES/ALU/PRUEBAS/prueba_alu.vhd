library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--use std.textio.all;
--use ieee.std_logic_textio.all;

use work.param_disenyo_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_deco_camino_pkg.all;

entity prueba_alu is
end prueba_alu;
 
architecture prueba of prueba_alu is 
 
component alu is
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end component;

component alu_ref is -- modelo referencia
    port (opALU : in  st_opALU;
          a	: in  tam_dat_camino;
          b	: in  tam_dat_camino;
          s	: out tam_dat_camino);
end component;

--Entradas
signal a,b : tam_dat_camino;
signal opALU: st_opALU;

--Salidas
signal s: tam_dat_camino;
signal sref: tam_dat_camino;   

constant periodo: time := 100 ns;

type t_opALU is array (0 to 10) of st_opALU;
constant c_opALU: t_opALU := (ALU_ADD,ALU_SUB,ALU_SLL,ALU_SLT,ALU_SLTU,ALU_XOR,ALU_SRL,ALU_SRA,ALU_OR,ALU_AND,ALU_NO);
type t_str8 is array (1 to 8) of character;
type t_vecstr8 is array (0 to 10) of t_str8;
constant opALU_str: t_vecstr8:= ("ALU_ADD ","ALU_SUB ","ALU_SLL ","ALU_SLT ","ALU_SLTU","ALU_XOR ","ALU_SRL ","ALU_SRA ","ALU_OR  ","ALU_AND ","ALU_NO  ");

begin

alu_P:  alu port map (opALU => opALU, a => a, b => b, s => s);
alu_R:  alu_ref port map (opALU => opALU, a => a, b => b, s => sref);


alu_prueba: process
begin
	report "incio";
	for k in c_opALU'range loop
		opALU <= c_opALU(k);
		report string(opALU_str(k));
		for i in (-2**4)-1 to 2**4-1 loop
			for j in (-2**4)-1 to 2**4-1 loop
		        a <= std_logic_vector(to_signed(i,tam_dat));
        		b <= std_logic_vector(to_signed(j,tam_dat));
				wait for periodo;
				if opALU /= ALU_NO then
					assert s = sref report "error " & string(opALU_str(k)) severity error;--failure;
				end if;
			end loop;
		end loop;
	end loop;
	report "final";
	wait;

end process;

end;

