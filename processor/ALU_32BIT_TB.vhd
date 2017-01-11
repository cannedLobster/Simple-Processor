
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ALU_32BIT_TB IS
END ALU_32BIT_TB;

ARCHITECTURE TEST OF ALU_32BIT_TB IS
COMPONENT alu_32bit
	PORT(	A : IN std_logic_vector(31 downto 0) ;
		B : IN std_logic_vector(31 downto 0) ;
		opsel : IN std_logic_vector(2 downto 0) ;
		mode : IN std_logic ;
		result : OUT std_logic_vector(31 downto 0) ;
		cout : OUT std_logic
	) ;
END component alu_32bit;
SIGNAL A_tb, B_tb, result_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL funct : std_logic_vector (3 downto 0) ;
alias mode_tb : std_logic IS funct(3) ;
alias opsel_tb : std_logic_vector IS funct (2 downto 0) ;
SIGNAL cout_tb: STD_LOGIC;

BEGIN
	alu_INST: alu_32bit PORT MAP(A_tb, B_tb, opsel_tb, mode_tb, result_tb, cout_tb) ;
	TB: PROCESS
	BEGIN
		A_tb <=  std_logic_vector(to_unsigned(32, 32));
		B_tb <= std_logic_vector(to_unsigned(256, 32));
		funct <= "0001" ;
		wait for 10 ns ;
		funct <= "0010" ;
		wait for 10 ns ;
		funct <= "0101" ;
		wait for 10 ns ;
		funct <= "0110" ;
		wait for 10 ns ;
		funct <= "0111" ;
		wait for 10 ns ;
		funct <= "1000" ;
		wait for 10 ns ;
		funct <= "1001" ;
		wait for 10 ns;
		funct <= "1011" ;
		wait for 10 ns;

		--additional testing accomdating odd functions

		wait for 30 ns;	
		funct <= "1111" ;
		wait for 10 ns ;
		funct <= "0000" ;
		wait for 10 ns ;
		funct <= "0011" ;
		wait for 10 ns ;		
		
	assert false report "finish" severity failure;
	END PROCESS;
END TEST;
		


