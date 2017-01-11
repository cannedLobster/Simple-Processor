--Sunny Xu CSE31L 2016SS2 SID: 60905232
library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;

ENTITY shiftl IS
	PORT(	in_0 : IN std_logic ;
		cin  : IN std_logic ;
		cout : OUT std_logic ;
		output : OUT std_logic 
	);
END shiftl ;

ARCHITECTURE shiftl_beh OF shiftl IS
BEGIN
	cout <= in_0 ;
	output <= cin ;
END shiftl_beh ;