library ieee ;
use ieee.std_logic_1164.all ;

ENTITY sign_ext_tb IS
END sign_ext_tb ;

ARCHITECTURE test OF sign_ext_tb IS
COMPONENT sign_ext
	GENERIC( 	IN_NBIT : INTEGER := 15 ;
			OUT_NBIT : INTEGER := 32) ;
	PORT(	in_0 : IN std_logic_vector(IN_NBIT - 1 downto 0) ;
		output : OUT std_logic_vector(OUT_NBIT - 1 downto 0)
	) ;
END COMPONENT  ;

signal inp : std_logic_vector (14 downto 0) ;
signal outp: std_logic_vector (31 downto 0) ;

BEGIN
	sign_ext_inst : sign_ext generic map (IN_NBIT => 15, OUT_NBIT => 32) port map ( inp, outp) ;
	tb : process
	begin
		wait for 10 ns ;
		inp <= "000000000000001" ;
		wait for 10 ns ;
		inp <= "100000000000001" ;
		wait for 10 ns ;
		inp <= "111111111111111" ;
		wait for 10 ns;

		assert false report "finish" severity failure ;
	end process ;
END test ;
