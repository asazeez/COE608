library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity adder16 is 
	port (
		a_in : in std_logic_vector(15 downto 0);
		b_in : in std_logic_vector(15 downto 0);
		c_in : in std_logic;
		sum_out : out std_logic_vector (15 downto 0);
		c_out : out std_logic
	);
end adder16;

architecture behaviour of adder16 is 
component adder4 is
	port (
		a_in : in std_logic_vector(3 downto 0);
		b_in : in std_logic_vector(3 downto 0);
		c_in : in std_logic;
		sum_out : out std_logic_vector (3 downto 0);
		c_out : out std_logic
	);
	end component;

signal carry  : std_logic_vector(2 downto 0);	

begin
	add3 :  adder4 port map (a_in(3 downto 0),b_in(3 downto 0),c_in,sum_out(3 downto 0),carry(0));
	add7 :  adder4 port map (a_in(7 downto 4),b_in(7 downto 4),carry(0),sum_out(7 downto 4),carry(1));
	add11 : adder4 port map (a_in(11 downto 8),b_in(11 downto 8),carry(1),sum_out(11 downto 8),carry(2));
	add15 : adder4 port map (a_in(15 downto 12),b_in(15 downto 12),carry(2),sum_out(15 downto 12),c_out);

end behaviour;	


