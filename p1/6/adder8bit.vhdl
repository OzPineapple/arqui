library ieee;
use ieee.std_logic_1164.all;

entity adder8bit is
	port(
		sel:	in std_logic;
		anum:	in	std_logic_vector(7 downto 0);
		bnum:	in	std_logic_vector(7 downto 0);
		led:	out std_logic;
		sum:	out	std_logic_vector(7 downto 0)
	);
end adder8bit;

architecture adder8bit_arch of adder8bit is
	component fulladder  is
		port(
			anum:	in	std_logic;
			bnum:	in	std_logic;
			cin:	in	std_logic;
			sum:	out	std_logic;
			cout:	out	std_logic
		);
	end component;
	component logicxor  is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic
		);
	end component;
	component logicxnor is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic
		);
	end component;
	component logicand  is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			o:	out	std_logic
		);
	end component;
	signal carry:	std_logic_vector(7 downto 0);
	signal bneg:	std_logic_vector(7 downto 0);
	signal sneg:	std_logic_vector(7 downto 0);
	signal cend:	std_logic;
begin
	rest0:	logicxor	port map( a => sel, b => bnum(0), o => bneg(0) );
	rest1:	logicxor	port map( a => sel, b => bnum(1), o => bneg(1) );
	rest2:	logicxor	port map( a => sel, b => bnum(2), o => bneg(2) );
	rest3:	logicxor	port map( a => sel, b => bnum(3), o => bneg(3) );
	rest4:	logicxor	port map( a => sel, b => bnum(4), o => bneg(4) );
	rest5:	logicxor	port map( a => sel, b => bnum(5), o => bneg(5) );
	rest6:	logicxor	port map( a => sel, b => bnum(6), o => bneg(6) );
	rest7:	logicxor	port map( a => sel, b => bnum(7), o => bneg(7) );
	sneg0:	fulladder	port map(anum => anum(0),	bnum => bneg(0),	cin => sel,			cout => carry(0),	sum => sneg(0) );
	sneg1:	fulladder	port map(anum => anum(1),	bnum => bneg(1),	cin => carry(0),	cout => carry(1),	sum => sneg(1) );
	sneg2:	fulladder	port map(anum => anum(2),	bnum => bneg(2),	cin => carry(1),	cout => carry(2),	sum => sneg(2) );
	sneg3:	fulladder	port map(anum => anum(3),	bnum => bneg(3),	cin => carry(2),	cout => carry(3),	sum => sneg(3) );
	sneg4:	fulladder	port map(anum => anum(4),	bnum => bneg(4),	cin => carry(3),	cout => carry(4),	sum => sneg(4) );
	sneg5:	fulladder	port map(anum => anum(5),	bnum => bneg(5),	cin => carry(4),	cout => carry(5),	sum => sneg(5) );
	sneg6:	fulladder	port map(anum => anum(6),	bnum => bneg(6),	cin => carry(5),	cout => carry(6),	sum => sneg(6) );
	sneg7:	fulladder	port map(anum => anum(7),	bnum => bneg(7),	cin => carry(6),	cout => carry(7),	sum => sneg(7) );
	ledh:	logicxor	port map( a => carry(7), b => carry(6), o => led  );
	idkw:	logicxnor	port map( a => carry(7), b => carry(6), o => cend );
	sum0:	logicand	port map( a => cend,	 b => sneg(0),	o => sum(0) );
	sum1:	logicand	port map( a => cend,	 b => sneg(1),	o => sum(1) );
	sum2:	logicand	port map( a => cend,	 b => sneg(2),	o => sum(2) );
	sum3:	logicand	port map( a => cend,	 b => sneg(3),	o => sum(3) );
	sum4:	logicand	port map( a => cend,	 b => sneg(4),	o => sum(4) );
	sum5:	logicand	port map( a => cend,	 b => sneg(5),	o => sum(5) );
	sum6:	logicand	port map( a => cend,	 b => sneg(6),	o => sum(6) );
	sum7:	logicand	port map( a => cend,	 b => sneg(7),	o => sum(7) );
end adder8bit_arch;
