library ieee ;
use ieee.std_logic_1164.all ;
use work.proc_components.all ;

ENTITY controller IS
	PORT( clk : IN std_logic 
	);
end ;

ARCHITECTURE struct OF controller IS
signal PC : std_logic_vector (4 downto 0) ;
signal d0 : std_logic_vector (4 downto 0) ;
signal instr: std_logic_vector (31 downto 0) ;

alias r_i : std_logic IS instr(31) ;
alias rs : std_logic_vector (5 downto 0) IS instr (30 downto 25) ;
alias rd : std_logic_vector (5 downto 0) IS instr (24 downto 19) ;
alias funct : std_logic_vector (3 downto 0) is instr (18 downto 15) ;
alias rt : std_logic_vector (5 downto 0) IS instr (14 downto 9) ;
alias immediate : std_logic_vector (14 downto 0) IS instr (14 downto 0) ;

signal we_temp : std_logic ;

signal tempa, opra, rt_b, im_b, tempb, oprb, result : std_logic_vector (31 downto 0) ;

BEGIN
	reg_inst : reg generic map (NBIT => 5) port map(clk => clk, din => d0, dout => PC) ;
	adder_inst : adder generic map (N => 5) port map(in_0 => PC, output => d0) ;

	mem_inst : mem generic map (N => 5, M => 32) port map(adr => PC, dout => instr) ;
	
	nullproc : process (instr)
	begin
		if (funct = "0000" or funct = "UUUU" or funct = "1111") then
			we_temp <= '0' ;
		else
			we_temp <= '1';
		end if ;
	end process ;
	
	regfile_inst : regfile
	generic map (NBIT => 32, NSEL => 6)
	port map(	clk => clk,
			we => we_temp,
			rs => rs,
			rt => rt,
			rd => rd,
			opr1 => tempa,
			opr2 => rt_b,
			wdata => result) ;

	sign_ext_inst : sign_ext generic map (IN_NBIT => 15, OUT_NBIT => 32) port map(in_0 => immediate, output => im_b) ;
	oprb_mux_inst : oprb_mux generic map (N => 32) port map(r_i => r_i, rt => rt_b, imm => im_b, 
				oprb => tempb) ;

	opr_switch : process (r_i, funct, tempa, tempb)
	begin
		if (r_i = '1' and (funct = "1001" or funct = "1011")) then
			opra <= tempb ;
			oprb <= tempa ;
		else
			opra <= tempa ;
			oprb <= tempb ;
		end if ;
	end process ;

	alu_32bit_inst : alu_32bit port map(A => opra, B => oprb, opsel => funct(2 downto 0),
				mode => funct(3), result => result) ;
END struct;
