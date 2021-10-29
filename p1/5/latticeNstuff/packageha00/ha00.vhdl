library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packageha00.all;

entity ha00 is
	port(
		A0: in std_logic;
		BO: in std_logic;
		SO: out std_logic;
		CO: out std_logic
	);
end ha00;

architecture ha0 of ha00 is
begin
	H00: anda00 port map(
		Aaa => A0,
		Baa => B0,
		Yaa => S0
	);
	H01: xora00 port map(
		Axa => A0,
		Bxa => B0,
		Yxa => S0
	);
end ha0;
