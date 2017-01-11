
library ieee ;
use ieee.std_logic_1164.all ;

ENTITY regfile_tb IS
END regfile_tb ;

ARCHITECTURE test OF regfile_tb IS
COMPONENT regfile
	GENERIC ( NBIT : INTEGER := 32;
		NSEL : INTEGER := 6);
	PORT (	clk : IN std_logic ;
		we : IN std_logic ; -- write enable
		rs : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 1
		rt : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 2
		rd : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- write address
		opr1 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 1
		opr2 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector ( NBIT -1 DOWNTO 0) -- write data 1
	);
END COMPONENT ;

signal clk_tb, we : std_logic ;
signal rs_tb, rt_tb, rd_tb : std_logic_vector (5 downto 0);
signal opr1_tb, opr2_tb, wdata_tb : std_logic_vector (31 downto 0) ;


BEGIN
	regfile_inst : regfile
	generic map (NBIT => 32, NSEL => 6)
	port map (clk_tb, we, rs_tb, rt_tb, rd_tb, opr1_tb, opr2_tb, wdata_tb) ;
	tb : process
	begin
		wait for 10 ns;
		clk_tb <= '0' ;
		we <= '1' ;
		rs_tb <= "000000" ;
		rt_tb <= "000001" ;
		rd_tb <= "000010" ;
		wdata_tb <= (others => '1') ;

		wait for 10 ns ;

		clk_tb <= '1' ;

		wait for 10 ns;

		clk_tb <= '0' ;
		rd_tb <= "000001" ;
		we <= '0' ;

		wait for 10 ns;

		clk_tb <= '1' ;
		rs_tb <= "000010" ;
		rt_tb <= "000001" ;
		rd_tb <= "000011" ;
		wdata_tb <= (others => '1') ;

		wait for 10 ns ;

		clk_tb <= '0' ;



		assert false report "finish" severity failure ;
	end process ;
END test ;
