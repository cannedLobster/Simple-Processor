--Sunny Xu CSE31L 2016SS2 SID: 60905232
library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;

ENTITY alu_32bit IS
	PORT(	A : IN std_logic_vector(31 downto 0) ;
		B : IN std_logic_vector(31 downto 0) ;
		opsel : IN std_logic_vector(2 downto 0) ;
		mode : IN std_logic ;
		result : OUT std_logic_vector(31 downto 0) ;
		cout : OUT std_logic
	) ;
END alu_32bit ;

ARCHITECTURE alu32_arch OF alu_32bit IS
	COMPONENT alu_1bit
		PORT(	a : IN std_logic ;
			b : IN std_logic ;
			cin : IN std_logic ;
			opsel : IN std_logic_vector(2 downto 0) ;
			mode : IN std_logic ;
			output : OUT std_logic ;
			cout : OUT std_logic
		) ;
	END COMPONENT ;
signal temp : std_logic_vector (31 downto 0) ;
BEGIN

	temp(0) <= '0';
	-- '0' b/c does not have to cover cases Increment(100)/Decrement(101)/Add&Inc(110)

	gen : for i in 0 to 30 GENERATE
		alu_1bit_inst : alu_1bit port map(a => A(i), b => B(i),
			cin => temp(i), opsel => opsel, mode => mode,
			output => result(i), cout => temp(i + 1) ) ;
	END GENERATE ;

	alu_1_bitinst : alu_1bit port map( a => A(31), b => B(31),
			cin => temp(31), opsel => opsel, mode => mode,
			output => result(31), cout => cout) ;
end alu32_arch ;
	

