library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity ror32 is 
port (
	a	: in std_logic_vector(31 downto 0);
	f 	: out std_logic_vector(31 downto 0)
);
end ror32;

architecture behaviour of ror32 is
begin
	f (30 downto 0) <= a (31 downto 1);
	f (31) <= a(0);
end behaviour;