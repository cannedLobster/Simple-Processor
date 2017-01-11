
library ieee ;
use ieee.std_logic_1164.all ;

PACKAGE proc_components IS
	COMPONENT reg IS
	GENERIC (NBIT: INTEGER := 32) ;
	PORT(
		clk : IN std_logic ;
		din : IN std_logic_vector(NBIT - 1 downto 0) ;
		dout : OUT std_logic_vector(NBIT - 1 downto 0)
	) ;
	END COMPONENT ;

	COMPONENT adder IS
	GENERIC( N : INTEGER := 32) ;
	PORT(	in_0 : IN std_logic_vector (N - 1 downto 0) ;
		output : OUT std_logic_vector (N - 1 downto 0)
	) ;
	END COMPONENT ;

	COMPONENT mem IS
	GENERIC (N: integer := 6;
		M: integer := 32) ;
	PORT(	adr : IN std_logic_vector(N - 1 downto 0) ;
		dout : OUT std_logic_vector(M - 1 downto 0)
	) ;
	END COMPONENT ;

	COMPONENT regfile IS
	GENERIC ( NBIT : INTEGER := 32;
		NSEL : INTEGER := 6);
	PORT (	clk : IN std_logic ;
		--rst_s : IN std_logic ; -- synchronous reset
		we : IN std_logic ; -- write enable
		rs : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 1
		rt : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 2
		rd : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- write address
		opr1 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 1
		opr2 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector ( NBIT -1 DOWNTO 0) -- write data 1
	);
	END COMPONENT ;

	COMPONENT sign_ext IS
	GENERIC( 	IN_NBIT : INTEGER := 15 ;
			OUT_NBIT : INTEGER := 32) ;
	PORT(	in_0 : IN std_logic_vector(IN_NBIT - 1 downto 0) ;
		output : OUT std_logic_vector(OUT_NBIT - 1 downto 0)
	) ;
	END COMPONENT ;

	COMPONENT oprb_mux IS
	GENERIC(N : INTEGER := 32) ;
	PORT(
		r_i : IN std_logic ;
		rt : IN std_logic_vector(N - 1 downto 0) ;
		imm : IN std_logic_vector(N - 1 downto 0) ;
		oprb : OUT std_logic_vector(N - 1 downto 0)		
	) ;
	END COMPONENT ;

	COMPONENT alu_32bit IS
	PORT(	A : IN std_logic_vector(31 downto 0) ;
		B : IN std_logic_vector(31 downto 0) ;
		opsel : IN std_logic_vector(2 downto 0) ;
		mode : IN std_logic ;
		result : OUT std_logic_vector(31 downto 0) ;
		cout : OUT std_logic
	) ;
	END COMPONENT ;
END proc_components ;