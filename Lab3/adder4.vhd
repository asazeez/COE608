library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity adder4 is 
	port (
	a_in : in std_logic_vector(3 downto 0);
	b_in : in std_logic_vector(3 downto 0);
	c_in : in std_logic;
	sum_out : out std_logic_vector (3 downto 0);
	c_out : out std_logic
);
end adder4;

architecture behaviour of adder4 is 
component fulladder is
	port (
	a : in std_logic;
	b : in std_logic;
	cin : in std_logic; 
	sum :	out std_logic; 
	cout : out std_logic
	);
	end component;
	
signal carry  : std_logic_vector(2 downto 0);

begin
	add0 : fulladder port map (a_in(0),b_in(0),c_in,sum_out(0),carry(0));
	add1 : fulladder port map (a_in(1),b_in(1),carry(0),sum_out(1),carry(1));
	add2 : fulladder port map (a_in(2),b_in(2),carry(1),sum_out(2),carry(2));
	add3 : fulladder port map (a_in(3),b_in(3),carry(2),sum_out(3),c_out);
	
end behaviour;	
	
	

