library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity mux8to1 is 
port (
	w0: in std_logic_vector (31 downto 0);
	w1: in std_logic_vector (31 downto 0);
	w2: in std_logic_vector (31 downto 0);
	w3: in std_logic_vector (31 downto 0);
	w4: in std_logic_vector (31 downto 0);
	w5: in std_logic_vector (31 downto 0);
	w6: in std_logic_vector (31 downto 0);
	w7: in std_logic_vector (31 downto 0);
	s:  in std_logic_vector (2 downto 0);
	y: out std_logic_vector (31 downto 0)
	
);
end mux8to1;

architecture behaviour of mux8to1 is
begin
	process (s, w0, w1, w2, w3, w4, w5, w6, w7)
	begin
		case s is 
			when "000" => y <= w0;
			when "001" => y <= w1;
			when "010" => y <= w2;
			when "011" => y <= w3;
			when "100" => y <= w4;
			when "101" => y <= w5;
			when "110" => y <= w6;
			when "111" => y <= w7;
			when others => y <= "--------------------------------";
		end case;
	end process; 
end behaviour; 		