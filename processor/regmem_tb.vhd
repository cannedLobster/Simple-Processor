
library ieee ;
use ieee.std_logic_1164.all ;

ENTITY regmem_tb IS
END ;

ARCHITECTURE test OF regmem_tb IS
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
signal clk_tb : std_logic ;
signal instr_tb : std_logic_vector (31 downto 0) ;
signal PC : std_logic_vector (3 downto 0) ;
signal d0 : std_logic_vector (3 downto 0) := "0000" ;
BEGIN
	reg_inst : reg port map(clk => clk_tb, din => d0, dout => PC) ;
	adder_inst : adder port map(in_0 => PC, output => d0) ;
	mem_inst : mem port map(adr => PC, dout => instr_tb) ;
	tb : process
	begin
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 100 ns ;
		
		assert false report "finish" severity failure ;
	end process ;
END test ;