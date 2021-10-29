library ieee;
use ieee.std_logic_1164.all;

entity mult4bit is
	port(
		a:	in	std_logic_vector(3 downto 0);
		b:	in	std_logic_vector(3 downto 0);
		r:	out	std_logic_vector(7 downto 0)
	);
end mult4bit;

architecture arch of mult4bit is
	component adder8bit is
		port(
			a:	in	std_logic_vector(7 downto 0);
			b:	in	std_logic_vector(7 downto 0);
			e:	in	std_logic;
			s:	out	std_logic_vector(7 downto 0);
			c:	out	std_logic
		);
	end component;
	signal p0, p1, p2, p3:	std_logic_vector(7 downto 0);
	signal s0, s1:			std_logic_vector(7 downto 0);
	signal carry:			std_logic_vector(1 downto 0);
begin

	p0(0) <= b(0) and a(0);
	p0(1) <= b(1) and a(0);
	p0(2) <= b(2) and a(0);
	p0(3) <= b(3) and a(0);
	p0(4) <= '0';
	p0(5) <= '0';
	p0(6) <= '0';
	p0(7) <= '0';

	p1(0) <= '0';
	p1(1) <= b(0) and a(1);
	p1(2) <= b(1) and a(1);
	p1(3) <= b(2) and a(1);
	p1(4) <= b(3) and a(1);
	p1(5) <= '0';
	p1(6) <= '0';
	p1(7) <= '0';

	p2(0) <= '0';
	p2(1) <= '0';
	p2(2) <= b(0) and a(2);
	p2(3) <= b(1) and a(2);
	p2(4) <= b(2) and a(2);
	p2(5) <= b(3) and a(2);
	p2(6) <= '0';
	p2(7) <= '0';

	p3(0) <= '0';
	p3(1) <= '0';
	p3(2) <= '0';
	p3(3) <= b(0) and a(3);
	p3(4) <= b(1) and a(3);
	p3(5) <= b(2) and a(3);
	p3(6) <= b(3) and a(3);
	p3(7) <= '0';

	r0: adder8bit port map( a => p0,	b => p1,	e => '0',		s => s0,	c => carry(0)	);
	r1: adder8bit port map( a => s0,	b => p2,	e => carry(0),	s => s1,	c => carry(1)	);
	s2: adder8bit port map( a => s1,	b => p3,	e => carry(1),	s => r,		c => open		);
end arch;
