library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity or32 is 
port (
	a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	f : out std_logic_vector(31 downto 0)
);
end or32;

architecture behaviour of or32 is
begin
	f <= a or b;
end behaviour;