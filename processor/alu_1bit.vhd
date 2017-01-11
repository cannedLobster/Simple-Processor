--Sunny Xu CSE31L 2016SS2 SID: 60905232
library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;

ENTITY alu_1bit IS
	PORT(	a : IN std_logic ;
		b : IN std_logic ;
		cin : IN std_logic ;
		opsel : IN std_logic_vector(2 downto 0) ;
		mode : IN std_logic ;
		output : OUT std_logic ;
		cout : OUT std_logic
	) ;
END alu_1bit ;

ARCHITECTURE alu1_arch OF alu_1bit IS
	COMPONENT addsub
		PORT(	in_0 : IN std_logic;
			in_1 : IN std_logic;
			cin  : IN std_logic;
			AddOrSub : IN std_logic;
			sum : OUT std_logic;
			cout : OUT std_logic
		);
	END COMPONENT ;

	COMPONENT b_op
		PORT(	in_0 : IN std_logic ;
			in_1 : IN std_logic ;
			sel : IN std_logic_vector(2 downto 0) ;
			output : OUT std_logic
		);
	END COMPONENT ;

	COMPONENT shiftl
		PORT(	in_0 : IN std_logic ;
			cin  : IN std_logic ;
			cout : OUT std_logic ;
			output : OUT std_logic 
		);
	END COMPONENT ;


signal aors, y : std_logic ;
signal f0, f1, f2, c0, c1 : std_logic ;

signal opr : std_logic ;

BEGIN
	addsub_inst : addsub port map(in_0 => a, in_1 => y, AddOrSub => aors,
			cin => cin, sum => f0, cout => c0) ;
	
	aors <= '0' when opsel = "001" else
		'1' when opsel = "010" else
		'U' ; -- WARNING :: U when not add/sub operation

	with opsel select y <=
		b when "001",
		b when "010", 
		'U' when others ;
	-- Warning :: U when not add/sub operation

	b_op_inst : b_op port map(in_0 => a, in_1 => b, sel => opsel,
			output => f1) ;

	shiftl_inst : shiftl port map(in_0 => a, cin => cin,
			output => f2, cout => c1) ;



	output <= f0 when mode & opsel = "0001" else
		f0 when mode & opsel = "0010" else
		f2 when mode & opsel = "1001" else
		f1 when mode & opsel = "0101" else
		f1 when mode & opsel = "0110" else
		f1 when mode & opsel = "0111" else
		f1 when mode & opsel = "1000" else
		f1 when mode & opsel = "1011" else
		'U' ;

	cout <= c0 when mode & opsel = "0001" else
		c0 when mode & opsel = "0010" else
		c1 when mode & opsel = "1001" else
		'0' ;

END alu1_arch ;
	
	
