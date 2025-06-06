library ieee;
use ieee.std_logic_1164.ALL;

ENTITY Control IS
	PORT(
			clk, mclk: IN STD_LOGIC;
			enable: IN STD_LOGIC;
			statusC, statusZ: IN STD_LOGIC;
			INST: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			A_Mux, B_Mux: OUT STD_LOGIC;
			IM_MUX1, REG_Mux: OUT STD_LOGIC;
			IM_MUX2, DATA_Mux: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			ALU_op : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			inc_PC, ld_PC : OUT STD_LOGIC;
			clr_IR: OUT STD_LOGIC;
			ld_IR: OUT STD_LOGIC;
			clr_A, clr_B, clr_C, clr_Z: OUT STD_LOGIC;
			ld_A, ld_B, ld_C, ld_Z: OUT STD_LOGIC;
			T : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			wen, en : OUT STD_LOGIC
	
	
		);
END Control;

ARCHITECTURE description OF Control IS
	TYPE STATETYPE IS (state_0, state_1, state_2);
	SIGNAL present_state: STATETYPE;
	SIGNAL Instruction_sig: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL Instruction_sig2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	Instruction_sig <= INST(31 DOWNTO 28);
	Instruction_sig2 <= INST(31 DOWNTO 24);
	
	
	PROCESS (present_state, INST, statusC, statusZ, enable, Instruction_sig, Instruction_sig2)
	BEGIN
		if enable = '1' then
			if present_state = state_0 then
				DATA_Mux <="00";
				clr_IR<='0';
				ld_IR<='1';
				ld_PC<='0';
				inc_PC<='0';
				clr_A<='0';
				ld_A<='0';
				ld_B<='0';
				clr_B<='0';
				clr_C<='0';
				ld_C<='0';
				clr_Z<='0';
				ld_Z<='0';
				en<='0';
				wen<='0';
				
			elsif present_state = state_1 then
				clr_IR<='0';
				ld_IR<='0';
				ld_PC<='1';
				inc_PC<='1';
				clr_A<='0';
				ld_A<='0';
				ld_B<='0';
				clr_B<='0';
				clr_C<='0';
				ld_C<='0';
				clr_Z<='0';
				ld_Z<='0';
				en<='0';
				wen<='0';
				
				if Instruction_sig = "0010" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='1';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					REG_Mux<='0';
					DATA_Mux<="00";
					en<='1';
					wen<='1';
		
				elsif Instruction_sig = "0011" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='1';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					REG_Mux<='1';
					DATA_Mux<="00";
					en<='1';
					wen<='1';
				elsif Instruction_sig = "1001" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='1';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					A_Mux<='0';
					DATA_Mux<="01";
					en<='1';
					wen<='0';
				elsif Instruction_sig = "1010" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='1';
					clr_A<='0';
					ld_A<='0';
					ld_B<='1';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					B_Mux<='0';
					DATA_Mux<="01";
					en<='1';
					wen<='0';
				end if;
			
			elsif present_state = state_2 then
			
				if Instruction_sig = "0101" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					
				elsif Instruction_sig = "0110" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					
				elsif Instruction_sig = "1000" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='1';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					
				elsif Instruction_sig = "1001" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					A_Mux<='0';
					DATA_Mux<="01";
					en<= '1';
					wen <= '0';
					
				elsif Instruction_sig = "1010" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='1';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					B_Mux<='0';
					DATA_Mux<="01";
					en<= '1';
					wen <= '0';
					
				elsif Instruction_sig = "0010" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					REG_Mux<='0';
					DATA_Mux<="00";
					en<= '1';
					wen <= '1';
					
				elsif Instruction_sig = "0011" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					REG_Mux<='1';
					DATA_Mux<="00";
					en<= '1';
					wen <= '1';	
				elsif Instruction_sig = "0000" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					A_Mux<='1';	
				elsif Instruction_sig = "0001" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='1';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					B_Mux<='1';
				elsif Instruction_sig = "0100" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='1';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
					ALU_op<="001";
					A_Mux<='0';
					DATA_Mux<="01";
					IM_MUX1<='1';
				elsif Instruction_sig2 = "01111001" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="000";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="01";
				elsif Instruction_sig2 = "01111110" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="110";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="10";		
				elsif Instruction_sig2 = "01110000" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="010";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="00";		
				elsif Instruction_sig2 = "01110010" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="110";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="00";		
				elsif Instruction_sig2 = "01110011" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="010";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="10";
				elsif Instruction_sig2 = "01111011" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="000";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="00";
				elsif Instruction_sig2 = "01110001" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="010";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="01";
				elsif Instruction_sig2 = "01111101" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="001";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
					IM_MUX2<="01";
				elsif Instruction_sig2 = "01110100" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="100";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
				elsif Instruction_sig2 = "01111111" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='1';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='1';
					clr_Z<='0';
					ld_Z<='1';
					ALU_op<="101";
					A_Mux<='0';
					DATA_Mux<="10";
					IM_MUX1<='0';
				elsif Instruction_sig2 = "01110101" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='1';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
				elsif Instruction_sig2 = "01110110" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='1';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='0';
					ld_Z<='0';
				elsif Instruction_sig2 = "01110111" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='1';
					ld_C<='0';
					clr_Z<='0';
						ld_Z<='0';
				elsif Instruction_sig2 = "01111000" then
					clr_IR<='0';
					ld_IR<='0';
					ld_PC<='0';
					inc_PC<='0';
					clr_A<='0';
					ld_A<='0';
					ld_B<='0';
					clr_B<='0';
					clr_C<='0';
					ld_C<='0';
					clr_Z<='1';
					ld_Z<='0';
				elsif Instruction_sig2 = "01111010" then
					if(statusZ = '1')then
						clr_IR<='0';
						ld_IR<='0';
						ld_PC<='1';
						inc_PC<='1';
						clr_A<='0';
						ld_A<='0';
						ld_B<='0';
						clr_B<='0';
						clr_C<='0';
						ld_C<='0';
						clr_Z<='0';
						ld_Z<='0';
					end if;
				elsif Instruction_sig2 = "01111100" then
					if(statusC = '1')then
						clr_IR<='0';
						ld_IR<='0';
						ld_PC<='1';
						inc_PC<='1';
						clr_A<='0';
						ld_A<='0';
						ld_B<='0';
						clr_B<='0';
						clr_C<='0';
						ld_C<='0';
						clr_Z<='0';
						ld_Z<='0';
					end if;
				end if;
			end if;
		end if;
	END PROCESS;

	PROCESS (clk, enable)
	begin 
		if enable = '1' then
			if rising_edge(clk) then
				if present_state = state_0 then present_state <= state_1;
				elsif present_state = state_1 then present_state <= state_2;
				else present_state <= state_0;
				end if;
			end if;
		else present_state <= state_0;
		end if;
	 END process;
	
	 WITH present_state select
		T <= "001" when state_0,
			  "010" when state_1,
			  "100" when state_2,
			  "001" when others;
END description;