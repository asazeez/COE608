library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity mux2to1 is 
port (
	w0 : in std_logic_vector(31 downto 0);
	w1	: in std_logic_vector(31 downto 0);
	s 	: in std_logic;
	y 	: out std_logic_vector(31 downto 0)
);
end mux2to1;

architecture behaviour of mux2to1 is
begin
	process (s, w0, w1)
	begin
		case s is 
			when '0' => y <= w0;
			when '1' => y <= w1;
			when others => y <= "--------------------------------";
		end case;
	end process; 
end behaviour;