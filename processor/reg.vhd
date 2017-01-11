
library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY reg IS
	GENERIC (NBIT: INTEGER := 4) ;
	PORT(
		clk : IN std_logic ;
		din : IN std_logic_vector(NBIT - 1 downto 0) ;
		dout : OUT std_logic_vector(NBIT - 1 downto 0)
	) ;
END reg ;

ARCHITECTURE seq_reg OF reg IS
BEGIN
	regist: process(clk)
		variable temp : std_logic_vector(NBIT - 1 downto 0) ;
		begin
			if (clk'event and clk = '1') then
				temp := din ;
			end if ;
			dout <= temp ;
		end process ;
END seq_reg ;