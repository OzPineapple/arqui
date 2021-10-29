library ieee;
use ieee.std_logic_1164.all;

entity adder16bit is
	port(
		a:	in	std_logic_vector(15 downto 0);
		b:	in	std_logic_vector(15 downto 0);
		e:	in	std_logic;
		s:	out	std_logic_vector(15 downto 0);
		c:	out	std_logic
	);
end adder16bit;

architecture arch of adder16bit is
	component fulladder  is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			e:	in	std_logic;
			s:	out	std_logic;
			c:	out	std_logic
		);
	end component;
	signal carry: std_logic_vector(14 downto 0);
begin
	s00: fulladder port map( a => a(0),  b => b(0),  e => e,		 s => s(0),  c => carry(0) );
	s01: fulladder port map( a => a(1),  b => b(1),  e => carry(0),  s => s(1),  c => carry(1) );
	s02: fulladder port map( a => a(2),  b => b(2),  e => carry(1),  s => s(2),  c => carry(2) );
	s03: fulladder port map( a => a(3),  b => b(3),  e => carry(2),  s => s(3),  c => carry(3) );
	s04: fulladder port map( a => a(4),  b => b(4),  e => carry(3),  s => s(4),  c => carry(4) );
	s05: fulladder port map( a => a(5),  b => b(5),  e => carry(4),  s => s(5),  c => carry(5) );
	s06: fulladder port map( a => a(6),  b => b(6),  e => carry(5),  s => s(6),  c => carry(6) );
	s07: fulladder port map( a => a(7),  b => b(7),  e => carry(6),  s => s(7),  c => carry(7) );
	s08: fulladder port map( a => a(8),  b => b(8),  e => carry(7),  s => s(8),  c => carry(8) );
	s09: fulladder port map( a => a(9),  b => b(9),  e => carry(8),  s => s(9),  c => carry(9) );
	s10: fulladder port map( a => a(10), b => b(10), e => carry(9),  s => s(10), c => carry(10) );
	s11: fulladder port map( a => a(11), b => b(11), e => carry(10), s => s(11), c => carry(11) );
	s12: fulladder port map( a => a(12), b => b(12), e => carry(11), s => s(12), c => carry(12) );
	s13: fulladder port map( a => a(13), b => b(13), e => carry(12), s => s(13), c => carry(13) );
	s14: fulladder port map( a => a(14), b => b(14), e => carry(13), s => s(14), c => carry(14) );
	s15: fulladder port map( a => a(15), b => b(15), e => carry(14), s => s(15), c => c );
end arch;
