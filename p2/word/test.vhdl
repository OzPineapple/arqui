library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component word is
		port(
			clock:		inout	std_logic;
			enable:		in		std_logic;
			code:		out		std_logic_vector(6 downto 0);
			ring:		out		std_logic_vector(5 downto 0)
		);
	end component;
	signal clock:	std_logic;
	signal enable:	std_logic;
	signal ring:	std_logic_vector(5 downto 0);
	signal code:	std_logic_vector(6 downto 0);
	constant period:	time := 2 ns;
begin
	conn:	word port map( clock => clock, enable => enable, ring => ring, code => code );
	clockP: process
	begin
		clock <= '0';
		wait for period / 2;
		clock <= '1';
		wait for period / 2;
	end process;

	enableP: process
	begin
		enable <= '0';
		wait for period;
		enable <= '1';
		wait;
	end process;
end arch;
