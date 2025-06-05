LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY reset_circuit IS
	PORT(
			Reset 	: IN STD_LOGIC;
			Clk		: IN STD_LOGIC;
			Enable_PD : OUT STD_LOGIC := '1';
			Clr_PC 	 : OUT STD_LOGIC
		  );
END reset_circuit;

ARCHITECTURE Behavior OF reset_circuit IS
	TYPE clkNum	IS (clk0,clk1,clk2, clk3);
	SIGNAL present_clk: clkNum;
BEGIN
	process(Clk) begin
		IF rising_edge(Clk) then
			IF Reset = '1' then
				Clr_PC <= '1';
				Enable_PD <= '0';
				present_clk <= clk0;
			ELSIF present_clk <= clk0 then	
				present_clk <= clk1;
			ELSIF present_clk <= clk1 then
				present_clk <= clk2;
			ELSIF present_clk <= clk2 then
				present_clk <= clk3;
			ELSIF present_clk <= clk3 then
				Clr_PC <= '0';
				Enable_PD <= '1';
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;