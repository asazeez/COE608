library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity add is
port(
		A			: in 	std_logic_vector(31 downto 0);
		B			: out std_logic_vector(31 downto 0)
		);
end add;

architecture Behavior of add is
begin
	B <= A + 4;
end Behavior;