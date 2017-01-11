--Sunny Xu CSE31L 2016SS2 SID: 60905232
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY addsub IS
	PORT(	in_0 : IN std_logic;
		in_1 : IN std_logic;
		cin  : IN std_logic;
		AddOrSub : IN std_logic;
		sum : OUT std_logic;
		cout : OUT std_logic
	);
END addsub;

ARCHITECTURE addsub_beh OF addsub IS
begin
	sum <= 	(in_0 xor in_1) xor cin;
	cout <= ((in_0 and in_1) or (cin and (in_0 xor in_1))) when AddOrSub = '0' else
		((not in_0 and in_1) or (not (in_0 xor in_1) and cin));
end addsub_beh ;