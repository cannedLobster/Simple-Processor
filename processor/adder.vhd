
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

ENTITY adder IS
	GENERIC( N : INTEGER := 4) ;
	PORT(	in_0 : IN std_logic_vector (N - 1 downto 0) ;
		output : OUT std_logic_vector (N - 1 downto 0)
	) ;
end adder;

ARCHITECTURE beh OF adder IS
BEGIN
	output <= std_logic_vector(to_unsigned(to_integer(unsigned(in_0)) + 1, N)) ;
END beh;