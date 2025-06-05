library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity register1 is
port(
		d			: in 	std_logic;
		ld			: in 	std_logic;
		clr		: in 	std_logic;
		clk		: in 	std_logic;
		Q			: out std_logic
		);
end register1;

architecture Behavior of register1 is
begin
	process (ld, clk, clr)
	begin 
		if clr = '1' then
			Q <= '0';
		elsif ((clk'event and clk = '1') and (ld = '1')) then
			Q <= d;
		end if;
	end process;
end Behavior;