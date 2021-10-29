library ieee;
use ieee.std_logic_1164.all;

entity mult8bit is
	port(
		a:	in	std_logic_vector(7  downto 0);
		b:	in	std_logic_vector(7  downto 0);
		r:	out	std_logic_vector(15 downto 0)
	);
end mult8bit;

architecture arch of mult8bit is
	component adder16bit is
		port(
			a:	in	std_logic_vector(15 downto 0);
			b:	in	std_logic_vector(15 downto 0);
			e:	in	std_logic;
			s:	out	std_logic_vector(15 downto 0);
			c:	out	std_logic
		);
	end component;
	signal p0, p1, p2, p3, p4, p5, p6, p7:	std_logic_vector(15 downto 0);
	signal s0, s1, s2, s3, s4, s5:			std_logic_vector(15 downto 0);
	signal carry:			std_logic_vector(5 downto 0);
begin

	p0(00) <= b(0) and a(0);
	p0(01) <= b(1) and a(0);
	p0(02) <= b(2) and a(0);
	p0(03) <= b(3) and a(0);
	p0(04) <= b(4) and a(0);
	p0(05) <= b(5) and a(0);
	p0(06) <= b(6) and a(0);
	p0(07) <= b(7) and a(0);
	p0(08) <= '0';
	p0(09) <= '0';
	p0(10) <= '0';
	p0(11) <= '0';
	p0(12) <= '0';
	p0(13) <= '0';
	p0(14) <= '0';
	p0(15) <= '0';

	p1(00) <= '0';
	p1(01) <= b(0) and a(1);
	p1(02) <= b(1) and a(1);
	p1(03) <= b(2) and a(1);
	p1(04) <= b(3) and a(1);
	p1(05) <= b(4) and a(1);
	p1(06) <= b(5) and a(1);
	p1(07) <= b(6) and a(1);
	p1(08) <= b(7) and a(1);
	p1(09) <= '0';
	p1(10) <= '0';
	p1(11) <= '0';
	p1(12) <= '0';
	p1(13) <= '0';
	p1(14) <= '0';
	p1(15) <= '0';

	p2(00) <= '0';
	p2(01) <= '0';
	p2(02) <= b(0) and a(2);
	p2(03) <= b(1) and a(2);
	p2(04) <= b(2) and a(2);
	p2(05) <= b(3) and a(2);
	p2(06) <= b(4) and a(2);
	p2(07) <= b(5) and a(2);
	p2(08) <= b(6) and a(2);
	p2(09) <= b(7) and a(2);
	p2(10) <= '0';
	p2(11) <= '0';
	p2(12) <= '0';
	p2(13) <= '0';
	p2(14) <= '0';
	p2(15) <= '0';

	p3(00) <= '0';
	p3(01) <= '0';
	p3(02) <= '0';
	p3(03) <= b(0) and a(3);
	p3(04) <= b(1) and a(3);
	p3(05) <= b(2) and a(3);
	p3(06) <= b(3) and a(3);
	p3(07) <= b(4) and a(3);
	p3(08) <= b(5) and a(3);
	p3(09) <= b(6) and a(3);
	p3(10) <= b(7) and a(3);
	p3(11) <= '0';
	p3(12) <= '0';
	p3(13) <= '0';
	p3(14) <= '0';
	p3(15) <= '0';

	p4(00) <= '0';
	p4(01) <= '0';
	p4(02) <= '0';
	p4(03) <= '0';
	p4(04) <= b(0) and a(4);
	p4(05) <= b(1) and a(4);
	p4(06) <= b(2) and a(4);
	p4(07) <= b(3) and a(4);
	p4(08) <= b(4) and a(4);
	p4(09) <= b(5) and a(4);
	p4(10) <= b(6) and a(4);
	p4(11) <= b(7) and a(4);
	p4(12) <= '0';
	p4(13) <= '0';
	p4(14) <= '0';
	p4(15) <= '0';

	p5(00) <= '0';
	p5(01) <= '0';
	p5(02) <= '0';
	p5(03) <= '0';
	p5(04) <= '0';
	p5(05) <= b(0) and a(5);
	p5(06) <= b(1) and a(5);
	p5(07) <= b(2) and a(5);
	p5(08) <= b(3) and a(5);
	p5(09) <= b(4) and a(5);
	p5(10) <= b(5) and a(5);
	p5(11) <= b(6) and a(5);
	p5(12) <= b(7) and a(5);
	p5(13) <= '0';
	p5(14) <= '0';
	p5(15) <= '0';

	p6(00) <= '0';
	p6(01) <= '0';
	p6(02) <= '0';
	p6(03) <= '0';
	p6(04) <= '0';
	p6(05) <= '0';
	p6(06) <= b(0) and a(6);
	p6(07) <= b(1) and a(6);
	p6(08) <= b(2) and a(6);
	p6(09) <= b(3) and a(6);
	p6(10) <= b(4) and a(6);
	p6(11) <= b(5) and a(6);
	p6(12) <= b(6) and a(6);
	p6(13) <= b(7) and a(6);
	p6(14) <= '0';
	p6(15) <= '0';

	p7(00) <= '0';
	p7(01) <= '0';
	p7(02) <= '0';
	p7(03) <= '0';
	p7(04) <= '0';
	p7(05) <= '0';
	p7(06) <= '0';
	p7(07) <= b(0) and a(7);
	p7(08) <= b(1) and a(7);
	p7(09) <= b(2) and a(7);
	p7(10) <= b(3) and a(7);
	p7(11) <= b(4) and a(7);
	p7(12) <= b(5) and a(7);
	p7(13) <= b(6) and a(7);
	p7(14) <= b(7) and a(7);
	p7(15) <= '0';

	r0: adder16bit port map( a => p0,	b => p1,	e => '0',		s => s0,	c => carry(0)	);
	r1: adder16bit port map( a => s0,	b => p2,	e => carry(0),	s => s1,	c => carry(1)	);
	r2: adder16bit port map( a => s1,	b => p3,	e => carry(1),	s => s2,	c => carry(2)	);
	r3: adder16bit port map( a => s2,	b => p4,	e => carry(2),	s => s3,	c => carry(3)	);
	r4: adder16bit port map( a => s3,	b => p5,	e => carry(3),	s => s4,	c => carry(4)	);
	r5: adder16bit port map( a => s4,	b => p6,	e => carry(4),	s => s5,	c => carry(5)	);
	r6: adder16bit port map( a => s5,	b => p7,	e => carry(5),	s => r,		c => open		);
end arch;
