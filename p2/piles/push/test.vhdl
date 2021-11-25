library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component pile is
		port(
			clock:	in	std_logic;
			enable:	in	std_logic;
			mode:	in	std_logic;
			push:	in	std_logic_vector(7 downto 0);
			pop:	out	std_logic_vector(7 downto 0)
		);
	end component;
	signal clock:	std_logic;
	signal enable:	std_logic;
	signal mode:	std_logic;
	signal push:	std_logic_vector(7 downto 0);
	signal pop:		std_logic_vector(7 downto 0);
	constant period: time:= 2 ns;
begin
	conn: pile port map( clock => clock, enable => enable, mode => mode, push => push, pop => pop );

	pclock: process
	begin
		clock <= '0';
		wait for period/2;
		clock <= '1';
		wait for period/2;
	end process pclock;

	pwork: process
	begin
		enable <= '0';
		mode <= '0';
		wait for period;
		enable <= '1';
		wait for period;
		push <= "01000001";
		wait for period;
		push <= "01000010";
		wait for period;
		push <= "01000011";
		wait for period;
		push <= "01000100";
		wait for period;
		mode <= '1';
		wait for period;
		mode <= '0';
		wait for period;
		push <= "01000101";
		wait for period;
		push <= "01000110";
		wait for period;
		push <= "01000111";
		mode <= '1';
		wait for period;
		mode <= '0';
		wait for period;
		wait for period;
		push <= "01001000";
		wait for period;
		push <= "01001001";
		wait for period;
		push <= "01001010";
		wait for period;
		mode <= '1';
		wait for period;
		mode <= '0';
		wait for period;
		push <= "01001011";
		wait for period;
		mode <= '1';
		wait;
	end process pwork;
end arch;
