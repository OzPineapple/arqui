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
			number:	out		std_logic_vector(31 downto 0)
		);
	end component;
	signal clock:	std_logic;
	signal enable:	std_logic;
	signal key:		std_logic_vector(3 downto 0);
	signal ring:	std_logic_vector(3 downto 0);
	signal number:	std_logic_vector(31 downto 0);
	constant period:	time := 2 ns;
begin
	conn:	keyboard	port map( clock => clock, enable => enable, ring => ring, key => key, number => number );
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

	pboard: process
		variable chest: std_logic_vector(3 downto 0);
	begin
		wait for period;
		chest := "0001";
		key   <= chest;
		wait for period;
		chest := "0001";
		key <= "0001";
		wait for period;
		key <= "0000";
		wait for period;

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
		
		key <= "0100";
		wait for 2*period;
		key <= "0000";
		wait for period;
		
		key <= "0100";
		wait for 4*period;
		key <= "0000";
		wait for period;

		for i in 0 to 3 loop
			wait for period;
			key(0) <= key(3);
			key( 2 downto 0 ) <= key( 3 downto 1 );
		end loop;

		wait;
	end process pboard;
		
end arch;
