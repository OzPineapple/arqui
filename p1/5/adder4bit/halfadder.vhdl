library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
	port(
		a:	in	std_logic;
		b:	in	std_logic;
		o:	out	std_logic;
		c:	out	std_logic
	);
end halfadder;

architecture halfadder_arch of halfadder is
	component logicand is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic
		);
	end component;
	component logicxor is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic
		);
	end component;
begin
	sum:	logicxor port map( a => a, b => b, o => o );
	carry:	logicand port map( a => a, b => b, o => c );
end halfadder_arch;
