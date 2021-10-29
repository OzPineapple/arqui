library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture test of test is
	component adder4bit is
		port(
			sel:	in	std_logic;
			anum:	in	std_logic_vector(3 downto 0);
			bnum:	in	std_logic_vector(3 downto 0);
			led:	out	std_logic;
			sum:	out	std_logic_vector(3 downto 0)
		);
	end component;
	signal anum, bnum, sum:		std_logic_vector(3 downto 0);
	signal sel, led:	std_logic;
begin
	conecctions : adder4bit port map( anum => anum, bnum => bnum, sel => sel, sum => sum, led => led );
	process begin
		sel <= '0';
		anum <= "0011";
		bnum <= "0100";
		wait for 20 ns;
		anum <= "0100";
		bnum <= "0101";
		wait for 20 ns;
		anum <= "1100";
		bnum <= "1001";
		wait for 20 ns;
		sel <= '1';
		anum <= "0011";
		bnum <= "0100";
		wait for 20 ns;
		anum <= "0100";
		bnum <= "0101";
		wait for 20 ns;
		anum <= "1100";
		bnum <= "1001";
		wait for 20 ns;
		wait;
	end process;
end test;
