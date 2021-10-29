library ieee;
use ieee.std_logic_1164.all;

entity logicor is
	port(
		a:	in	std_logic;
		b:	in	std_logic;
		o:	out	std_logic
	);
end logicor;

architecture logicor of logicor is
begin
	o <= a or b;
end logicor;
