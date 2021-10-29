library ieee;
use ieee.std_logic_1164.all;

entity logicxnor is
	port(
		a:	in	std_logic;
		b:	in	std_logic;
		o:	out	std_logic
	);
end logicxnor;

architecture logicxnor_arch of logicxnor is
begin
	o <= a xnor b;
end logicxnor_arch;
