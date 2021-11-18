library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
end test;

architecture arch of test is
	component coder is
		port(
			clock:	in		std_logic;
			reset:	in		std_logic;
			mode:	in		std_logic;
			key:	in		std_logic_vector(3 downto 0);
			ring:	in		std_logic_vector(3 downto 0);
			word:	out		std_logic_vector(6 downto 0);
			count:	inout	std_logic_vector(5 downto 0);
			flag:	out		std_logic
		);
	end component;
	signal clock:	std_logic;
	signal reset:	std_logic;
	signal mode:	std_logic;
	signal key:		std_logic_vector(3 downto 0);
	signal ring:	std_logic_vector(3 downto 0);
	signal word:	std_logic_vector(6 downto 0);
	signal count:	std_logic_vector(5 downto 0);
	signal flag:	std_logic;
	constant period: time:= 2 ns;
begin
	conn: coder port map( clock => clock, reset => reset, mode => mode, key => key, ring => ring, word => word, count => count, flag => flag );
	mode <= '0';
	pclock: process
	begin
		clock <= '0';
		wait for period /2;
		clock <= '1';
		wait for period /2;
	end process pclock;
	penable: process
	begin
		reset <= '0';
		wait for period;
		reset <= '1';
		wait;
	end process penable;
	pboard: process
		variable chest: std_logic_vector(3 downto 0);
	begin
		wait for period;
		chest := "0001";
		key   <= chest;
		ring  <= "0001";
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				key <= chest;
				wait for period;
				key <= "0000";
				wait for period;
				key <= chest;
				ring <= ring sll 1;
			end loop;
			chest := chest sll 1;
			ring <= "0001";
		end loop;
		wait;
	end process pboard;
end;
