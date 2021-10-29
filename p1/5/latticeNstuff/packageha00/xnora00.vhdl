library iee;
use ieee.std_logic_1164.all;

entity xnora00 is
	port(
		Axn: in std_logic;
		Bxn: in std_logic;
		Yxn: out std_logic;
	);
end xnora00;

architecture xnora0 of xnora00 is
begin
	Yxn <= Axn xnor Bxn;
end xnora0;
