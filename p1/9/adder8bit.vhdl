library ieee;
use ieee.std_logic_1164.all;

entity adder8bit is
	port(
		a:	in	std_logic_vector(7 downto 0);
		b:	in	std_logic_vector(7 downto 0);
		e:	in	std_logic;
		s:	out	std_logic_vector(7 downto 0);
		c:	out	std_logic
	);
end adder8bit;

architecture arch of adder8bit is
	component fulladder  is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			e:	in	std_logic;
			s:	out	std_logic;
			c:	out	std_logic
		);
	end component;
	signal carry: std_logic_vector(6 downto 0);
begin
	s0:	fulladder port map( a => a(0), b => b(0), e => e,		 s => s(0), c => carry(0) );
	s1:	fulladder port map( a => a(1), b => b(1), e => carry(0), s => s(1), c => carry(1) );
	s2:	fulladder port map( a => a(2), b => b(2), e => carry(1), s => s(2), c => carry(2) );
	s3:	fulladder port map( a => a(3), b => b(3), e => carry(2), s => s(3), c => carry(3) );
	s4:	fulladder port map( a => a(4), b => b(4), e => carry(3), s => s(4), c => carry(4) );
	s5:	fulladder port map( a => a(5), b => b(5), e => carry(4), s => s(5), c => carry(5) );
	s6:	fulladder port map( a => a(6), b => b(6), e => carry(5), s => s(6), c => carry(6) );
	s7:	fulladder port map( a => a(7), b => b(7), e => carry(6), s => s(7), c => c );
end arch;
