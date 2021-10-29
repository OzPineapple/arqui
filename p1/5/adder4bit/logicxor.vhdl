library ieee;
use ieee.std_logic_1164.all;

entity logicxor is
	port(
		a:	in	std_logic;
		b:	in	std_logic;
		o:	out	std_logic
	);
end logicxor;

architecture logicxor of logicxor is
begin
	o <= a xor b;
end logicxor;
