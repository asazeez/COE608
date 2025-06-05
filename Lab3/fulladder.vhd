library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity fulladder is 
	port (
	a : in std_logic;
	b : in std_logic;
	cin : in std_logic; 
	sum :	out std_logic; 
	cout : out std_logic
	);
end fulladder;
	
architecture behaviour of fulladder is 
begin 
	sum <= (a xor b) xor cin;
	cout <= (a and b) or (a and cin) or (cin and b);
end behaviour;
	