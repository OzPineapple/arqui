library ieee;
use ieee.std_logic_1164.all;

entity logicand is
	port(
		a:	in	std_logic;
		b:	in	std_logic;
		o:	out	std_logic
	);
end logicand;

architecture logicand of logicand is
begin
	o <= a and b;
end logicand;
