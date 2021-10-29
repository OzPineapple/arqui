library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture test of test is
	component adder8bit is
		port(
			sel:	in	std_logic;
			anum:	in	std_logic_vector(7 downto 0);
			bnum:	in	std_logic_vector(7 downto 0);
			led:	out	std_logic;
			sum:	out	std_logic_vector(7 downto 0)
		);
	end component;
	signal anum, bnum, sum:		std_logic_vector(7 downto 0);
	signal sel, led:	std_logic;
begin
	conecctions : adder8bit port map( anum => anum, bnum => bnum, sel => sel, sum => sum, led => led );
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
end test;
