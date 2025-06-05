library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity and32 is
port (
	a	: in std_logic_vector(31 downto 0);
	b 	: in std_logic_vector(31 downto 0);
	f 	: out std_logic_vector(31 downto 0)
);
end and32;

architecture behavior of and32 is
begin
	f<= a and b;
end behavior;