library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packageadder4bit00.all;

entity adder4bit00 is
	port(
		Ai: in std_logic_vector(3 downto 0);
		Bi: in std_logic_vector(3 downto 0);
		SL: in std_logic_vector(3 downto 0);
		So: in std_logic_vector(3 downto 0);
		LED: in std_logic_vector(3 downto 0)
	);
end adder4bit00;

architecture adder4bit0 of adder4bit00 is
	signal SB, SC, SA: std_logic_vector();
	signal Sx: std_logic;
begin
	A00: xora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A01: xora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A02: xora00 port map();
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A03: xora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A04: fa00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A05: fa00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A06: fa00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A07: fa00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A08: and00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A09: and00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A10: and00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A11: and00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A12: xnora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A13: xnora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A14: xnora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
	A15: xnora00 port map(
		Axa => SL,
		Bxa => Bi(0),
		Yxa => SB(0)
	);
end adder4bit;
