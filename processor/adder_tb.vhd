
library ieee ;
use ieee.std_logic_1164.all ;

ENTITY adder_tb IS
END adder_tb ;

ARCHITECTURE test OF adder_tb IS
COMPONENT adder
	GENERIC( N : INTEGER := 4) ;
	PORT(	in_0 : IN std_logic_vector (N - 1 downto 0) ;
		output : OUT std_logic_vector (N - 1 downto 0)
	) ;
END COMPONENT ;
signal in_tb, out_tb : std_logic_vector (3 downto 0) ;
BEGIN
	adder_inst : adder
	generic map ( N => 4 )
	port map ( in_tb , out_tb) ;
	tb : process
	begin
		wait for 10 ns;
		in_tb <= "1111" ;
		wait for 10 ns;
		in_tb <= "0000" ;
		wait for 10 ns;
		in_tb <= "0001" ;
		wait for 10 ns;


		assert false report "finish" severity failure ;
	end process ;
END test ;