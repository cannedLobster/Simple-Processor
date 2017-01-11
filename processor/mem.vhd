library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

ENTITY mem IS
	GENERIC (N: integer := 5;
		M: integer := 32) ;
	PORT(	adr : IN std_logic_vector(N - 1 downto 0) ;
		dout : OUT std_logic_vector(M - 1 downto 0)
	) ;
end ;

ARCHITECTURE beh OF mem IS
	TYPE mem_array IS array (2**N - 1 downto 0) OF std_logic_vector (M - 1 downto 0) ;
BEGIN
	mem_handle : process (adr)
	variable mem : mem_array ;
	begin

		--Set up register file and use add/sub

		mem(0) := (others => 'U') ;
		mem(1) := (others => '0') ;
		mem(2) := (others => '0') ;
		mem(3) := "10000010000010001000000000000001" ;
		mem(4) := "10000000000000001000000000000100" ;
		mem(5) := "00000000000100001000001UUUUUUUUU" ;
		mem(6) := "00000100000110010000001111111111" ;
		mem(7) := "00000010000010010000011000000000" ;
		mem(8) := "00000100001000010000000000000000" ;

		-- Use immediate logic instructions
		
		mem(9) := "10000100000110101000000000001001" ;
		mem(10) := "10000100001010110000000000001001" ;
		mem(11) := "10001010001100111UUUUUUUUUUUUUUU" ;
		mem(12) := "10000100001111000000000000001001" ;
		mem(13) := "1UUUUUU0010001001101101110111101" ;
		mem(14) := "1UUUUUU0010011011101101110111101" ;

		-- Use read logic instructions

		mem(15) := "00001011110100101000111UUUUUUUUU" ;
		mem(16) := "00000111110110110000101UUUUUUUUU" ;
		mem(17) := "00001101111000111UUUUUU111111111" ;
		mem(18) := "00000111111011000111011111111111" ;
		mem(19) := "00010001111101001UUUUUU000000000" ;
		mem(20) := "00010011111111011UUUUUU000000000" ;

		-- Any additional misc instructions

		mem(21) := "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" ;
		mem(22) := "11111111111111111111111111111111" ;
		
		dout <= mem(to_integer(unsigned(adr))) ;
	end process ;
END ;
