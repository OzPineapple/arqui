library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component keyboard is
		port(
			clock:	in		std_logic;
			enable:	in		std_logic;
			key:	in		std_logic_vector(3 downto 0);
			ring:	inout	std_logic_vector(3 downto 0);
			code:	out		std_logic_vector(7 downto 0)
		);
	end component;
	signal clock:	std_logic;
	signal enable:	std_logic;
	signal key:		std_logic_vector(3 downto 0);
	signal ring:	std_logic_vector(3 downto 0);
	signal code:	std_logic_vector(7 downto 0);
	constant period:	time := 2 ns;
begin
	conn:	keyboard	port map( clock => clock, enable => enable, ring => ring, key => key, code => code );
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
	keyP: process
	begin
		wait for 2 * period;

		key <= "0010";
		wait for period;
		key <= "0000";
		wait for period;

		key <= "0100";
		wait for 2*period;
		key <= "0000";
		wait for period;

		key <= "1000";
		wait for 3*period;
		key <= "0000";
		wait for period;

		key <= "0001";
		wait for period;
		key <= "0000";
		wait for period;

		wait;
	end process;
		
end arch;
