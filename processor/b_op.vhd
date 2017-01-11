--Sunny Xu CSE31L 2016SS2 SID: 60905232
library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;

ENTITY b_op IS
	PORT(	in_0 : IN std_logic ;
		in_1 : IN std_logic ;
		sel : IN std_logic_vector(2 downto 0) ;
		output : OUT std_logic
	);
	-- sel/out| 00/AND 01/OR 10/XOR 11/NOTA
END b_op ;

ARCHITECTURE b_op_beh OF b_op IS
BEGIN
	output <= (in_0 and in_1) when sel = "101" else
		(in_0 or in_1) when sel = "110" else
		(in_0 xor in_1) when sel ="000" else
		(not in_0) when sel = "111" else
		in_0 when sel = "011" else
		'U' ;
END b_op_beh ;