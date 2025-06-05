library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity not32 is 
port (
	a : in std_logic_vector(31 downto 0);
	f : out std_logic_vector(31 downto 0)
);
end not32;

architecture behaviour of not32 is
begin 	
	f <= not a;
end behaviour;