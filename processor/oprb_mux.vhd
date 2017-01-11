library ieee ;
use ieee.std_logic_1164.all ;

ENTITY oprb_mux IS
	GENERIC(N : INTEGER := 32) ;
	PORT(
		r_i : IN std_logic ;
		rt : IN std_logic_vector(N - 1 downto 0) ;
		imm : IN std_logic_vector(N - 1 downto 0) ;
		oprb : OUT std_logic_vector(N - 1 downto 0)		
	) ;
end ;

ARCHITECTURE beh OF oprb_mux IS
BEGIN
	oprb <= rt when r_i = '0' else
		imm ;
end beh ;