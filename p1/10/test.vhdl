library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component mult8bit is
		port(
			a:	in	std_logic_vector(7  downto 0);
			b:	in	std_logic_vector(7  downto 0);
			r:	out	std_logic_vector(15 downto 0)
		);
	end component;
	signal a: std_logic_vector(7  downto 0);
	signal b: std_logic_vector(7  downto 0);
	signal r: std_logic_vector(15 downto 0);
begin
	conn: mult8bit port map( a => a, b => b, r => r );
	process begin
		a <= "00000001";
		b <= "00000001";
		wait for 10 ns;
		a <= "00000010";
		b <= "00000010";
		wait for 10 ns;
		a <= "00000011";
		b <= "00000011";
		wait for 10 ns;
		a <= "00000100";
		b <= "00000100";
		wait for 10 ns;
		a <= "00000101";
		b <= "00000101";
		wait for 10 ns;
		a <= "00001000";
		b <= "00001000";
		wait for 10 ns;
		a <= "00001001";
		b <= "00001001";
		wait for 10 ns;
		a <= "00010000";
		b <= "00010000";
		wait for 10 ns;
		a <= "00010001";
		b <= "00010001";
		wait for 10 ns;
		a <= "00100000";
		b <= "00100000";
		wait for 10 ns;
		a <= "00100001";
		b <= "00100001";
		wait for 10 ns;
		a <= "01000000";
		b <= "01000000";
		wait for 10 ns;
		a <= "01000001";
		b <= "01000001";
		wait for 10 ns;
		a <= "10000000";
		b <= "10000000";
		wait for 10 ns;
		a <= "10000001";
		b <= "10000001";
		wait for 10 ns;
		a <= "11111111";
		b <= "11111111";
		wait for 10 ns;
		wait;
	end process;
end arch;
