library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity test is
end test;

architecture arch of test is
	component adder8bit is
		port(
			sel:	in	std_logic;
			anum:	in	signed(7 downto 0);
			bnum:	in	signed(7 downto 0);
			sum:	out	signed(7 downto 0)
		);
	end component;
	signal	sel:	std_logic;
	signal	anum:	signed(7 downto 0);
	signal	bnum:	signed(7 downto 0);
	signal	sum:	signed(7 downto 0);
begin
	adder: adder8bit port map( sel => sel, anum => anum, bnum => bnum, sum => sum );
	process begin
		sel <= '0';
		anum <= "00000011";
		bnum <= "00000100";
		wait for 20 ns;
		anum <= "01000000";
		bnum <= "01000010";
		wait for 20 ns;
		anum <= "10000001";
		bnum <= "10000000";
		wait for 20 ns;
		sel <= '1';
		anum <= "00000011";
		bnum <= "00000100";
		wait for 20 ns;
		anum <= "01000000";
		bnum <= "01000010";
		wait for 20 ns;
		anum <= "10000001";
		bnum <= "10000000";
		wait for 20 ns;
		wait;
	end process;
end arch;
