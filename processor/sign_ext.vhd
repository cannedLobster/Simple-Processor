
library ieee ;
use ieee.std_logic_1164.all ;

ENTITY sign_ext IS
	GENERIC( 	IN_NBIT : INTEGER := 15 ;
			OUT_NBIT : INTEGER := 32) ;
	PORT(	in_0 : IN std_logic_vector(IN_NBIT - 1 downto 0) ;
		output : OUT std_logic_vector(OUT_NBIT - 1 downto 0)
	) ;
END sign_ext ;

ARCHITECTURE beh OF sign_ext IS
BEGIN
	output(OUT_NBIT - 1 downto IN_NBIT) <= (others => in_0(IN_NBIT - 1)) ;
	output(IN_NBIT - 1 downto 0) <= in_0(IN_NBIT - 1 downto 0) ;
END beh ;