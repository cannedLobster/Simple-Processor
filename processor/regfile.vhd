
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
ENTITY regfile IS
	GENERIC ( NBIT : INTEGER := 32;
		NSEL : INTEGER := 6);
	PORT (	clk : IN std_logic ;
		--rst_s : IN std_logic ; -- synchronous reset
		we : IN std_logic ; -- write enable
		rs : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 1
		rt : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 2
		rd : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- write address
		opr1 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 1
		opr2 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector ( NBIT -1 DOWNTO 0) -- write data 1
	);
END regfile ;

ARCHITECTURE seq_regfile OF regfile IS
	subtype word is std_logic_vector(NBIT - 1 downto 0) ;
	type regFileTyp is array(0 to 2**NSEL - 1) of WORD;
BEGIN
	funct : process(clk, rs, rt)
	variable mem1 : regFileTyp := (others => (others => '0')) ;
	variable rdata1v, rdata2v : std_logic_vector (NBIT - 1 downto 0) ;
	begin
		if (clk = '1') then
			rdata1v := mem1(to_integer(unsigned(rs))) ;
			rdata2v := mem1(to_integer(unsigned(rt))) ;
		elsif (clk'event and clk = '0') then
			if (we = '1') then
				mem1(to_integer(unsigned(rd))) := wdata ;
			end if ;
		end if ;
		opr1 <= rdata1v ;
		opr2 <= rdata2v ;
	end process ;
END seq_regfile ;
				