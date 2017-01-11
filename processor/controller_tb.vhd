
library ieee ;
use ieee.std_logic_1164.all ;

ENTITY controller_tb IS
END controller_tb ;

ARCHITECTURE test of controller_tb IS
	COMPONENT controller
		PORT( clk : IN std_logic 
		);
	END COMPONENT ;
signal clk_tb : std_logic ;
BEGIN
	controller_inst : controller port map(clk_tb) ;
	TB : process
	begin
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;

		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;

		wait for 10 ns;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;

		wait for 10 ns;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;

		wait for 10 ns;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;

		wait for 10 ns;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		wait for 10 ns ;
		clk_tb <= '1' ;
		wait for 10 ns ;
		clk_tb <= '0' ;
		
		assert false report "finish" severity failure ;
	end process ;

END test ;