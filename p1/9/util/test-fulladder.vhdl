library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component fulladder is
		port(
			a:	in	std_logic;
			b:	in	std_logic;
			e:	in	std_logic;
			s:	out	std_logic;
			c:	out	std_logic
		);
	end component;
	signal a, b, e, s, c:	std_logic;
begin
	connections: fulladder port map( a=>a, b=>b, e=>e, s=>s, c=>c);
	process begin
		a<='0';
		b<='0';
		e<='0';
		wait for 10 ns;
		a<='1';
		b<='0';
		e<='0';
		wait for 10 ns;
		a<='0';
		b<='1';
		e<='0';
		wait for 10 ns;
		a<='1';
		b<='1';
		e<='0';
		wait for 10 ns;
		a<='0';
		b<='0';
		e<='1';
		wait for 10 ns;
		a<='1';
		b<='0';
		e<='1';
		wait for 10 ns;
		a<='0';
		b<='1';
		e<='1';
		wait for 10 ns;
		a<='1';
		b<='1';
		e<='1';
		wait for 10 ns;
		wait;
	end process;
end arch;
