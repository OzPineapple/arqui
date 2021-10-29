library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port(
		a:	in	std_logic;
		b:	in	std_logic;
		e:	in	std_logic;
		s:	out	std_logic;
		c:	out	std_logic
	);
end fulladder;

architecture arch of fulladder is
	component halfadder is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			s:	out	std_logic;
			c:	out	std_logic
		);
	end component;
	signal sum, carryA, carryB:	std_logic;
begin
	first:	halfadder	port map( a => a, b => b,	s => sum,	c => carryA );
	second:	halfadder	port map( a => e, b => sum,	s => s,		c => carryB );
	c <= carryA or carryB;
end arch;
