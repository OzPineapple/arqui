library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component mult4bit is
		port(
			a:	in	std_logic_vector(3 downto 0);
			b:	in	std_logic_vector(3 downto 0);
			r:	out	std_logic_vector(7 downto 0)
		);
	end component;
	signal a: std_logic_vector(3 downto 0);
	signal b: std_logic_vector(3 downto 0);
	signal r: std_logic_vector(7 downto 0);
begin
	conn: mult4bit port map( a => a, b => b, r => r );
	process begin
		a <= "0001";
		b <= "0001";
		wait for 10 ns;
		a <= "0001";
		b <= "0010";
		wait for 10 ns;
		a <= "0010";
		b <= "0010";
		wait for 10 ns;
		a <= "0100";
		b <= "0100";
		wait for 10 ns;
		a <= "1000";
		b <= "1000";
		wait for 10 ns;
		a <= "1111";
		b <= "1111";
		wait for 10 ns;
		wait;
	end process;
end arch;
