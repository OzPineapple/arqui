library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component rom is
		port(
			enable:		in		std_logic;
			clock:		in		std_logic;
			adress:		inout	std_logic_vector(4 downto 0);
			data:		out		std_logic_vector(6 downto 0)
		);
	end component;
	signal enable:		std_logic;
	signal clock:		std_logic;
	signal adress:		std_logic_vector(4 downto 0);
	signal data:		std_logic_vector(6 downto 0);
	constant period:	time := 2 ns;
begin
	con: rom port map( enable => enable, clock => clock, adress => adress, data => data );

	pclock: process
	begin
		clock <= '0';
		wait for period / 2;
		clock <= '1';
		wait for period / 2;
	end process pclock;

	penable: process
	begin
		enable <= '0';
		wait for period;
		enable <= '1';
		wait;
	end process penable;
end arch;
