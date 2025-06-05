library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity adder32 is
port (
		a_in : in std_logic_vector(31 downto 0);
		b_in : in std_logic_vector(31 downto 0);
		c_in : in std_logic;
		sum_out : out std_logic_vector (31 downto 0);
		c_out : out std_logic
);
end adder32;

architecture behaviour of adder32 is
component adder16 is
	port (
		a_in : in std_logic_vector(15 downto 0);
		b_in : in std_logic_vector(15 downto 0);
		c_in : in std_logic;
		sum_out : out std_logic_vector (15 downto 0);
		c_out : out std_logic
	);
	end component;

signal carry  : std_logic;

begin
	add16 :  adder16 port map (a_in(15 downto 0),b_in(15 downto 0),c_in,sum_out(15 downto 0),carry);
	add31 :  adder16 port map (a_in(31 downto 16),b_in(31 downto 16),carry,sum_out(31 downto 16),c_out);

end behaviour;	

	
	