library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port(
		anum:	in	std_logic;
		bnum:	in	std_logic;
		cin:	in	std_logic;
		sum:	out	std_logic;
		cout:	out	std_logic
	);
end fulladder;

architecture fulladder_arch of fulladder is
	component halfadder is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic;
			c:	out	std_logic
		);
	end component;
	component logicor is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic
		);
	end component;
	signal carryA, carryB, sumPass : std_logic;
begin
	firtsum:	halfadder	port map( a => anum,	b => bnum,		o => sumPass,	c => carryB );
	secondsum:	halfadder	port map( a => cin,		b => sumPass,	o => sum,		c => carryA );
	handlec:	logicor		port map( a => carryA,	b => carryB,	o => cout );
end fulladder_arch;
