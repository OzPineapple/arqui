library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component adder8bit is
		port(
			a:	in	std_logic_vector(7 downto 0);
			b:	in	std_logic_vector(7 downto 0);
			e:	in	std_logic;
			s:	out	std_logic_vector(7 downto 0);
			c:	out	std_logic
		);
	end component;
	signal a,b,s: std_logic_vector(7 downto 0);
	signal e,c: std_logic;
begin
	connections: adder8bit port map( a=>a, b=>b, e=>e, s=>s, c=>c );
	process begin
		e <= '0';
		a <= "00010000";
		b <= "00100000";
		wait for 10 ns;
		e <= '0';
		a <= "10010000";
		b <= "01010000";
		wait for 10 ns;
		e <= '1';
		a <= "10000000";
		b <= "01000000";
		wait for 10 ns;
		e <= '1';
		a <= "01000000";
		b <= "01000000";
		wait for 10 ns;
		wait;
	end process;
end arch;
