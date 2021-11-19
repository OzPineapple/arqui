library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch of test is
	component ram is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic;
		key:		in		std_logic_vector(3 downto 0);
		ring:		inout	std_logic_vector(3 downto 0);
		count:		inout	std_logic_vector(5 downto 0);
		adress:		inout	std_logic_vector(5 downto 0);
		display:	out		std_logic_vector(6 downto 0);
		flag:		inout	std_logic
	);
	end component;
	signal clock:		std_logic;
	signal reset:		std_logic;
	signal mode:		std_logic;
	signal key:			std_logic_vector(3 downto 0);
	signal ring:		std_logic_vector(3 downto 0);
	signal count:		std_logic_vector(5 downto 0);
	signal adress:		std_logic_vector(5 downto 0);
	signal display:		std_logic_vector(6 downto 0);
	signal flag:		std_logic;
	constant period: time:= 2 ns;
begin
	conn: ram port map( clock => clock, reset => reset, mode => mode, key => key, ring => ring, count => count, adress => adress, display => display, flag => flag );
	pclock: process
	begin
		clock <= '0';
		wait for period / 2;
		clock <= '1';
		wait for period / 2;
	end process pclock;
	-- 00 init
	-- 10 write
	-- 11 read
	pwork: process
		variable chest: std_logic_vector(3 downto 0);
		variable aux: std_logic;
	begin
		key <= "0001";
		reset <= '0';
		mode  <= '0';
		wait for period;
		reset <= '1';
		wait for period/2;
		for j in 0 to 3 loop
			chest := "0001";
			for i in 0 to 3 loop
				wait for j * period;
				key <= chest;
				wait for period/2;
				key <= "0000";
				wait for (3-j)*period;
				wait for period/2;
				aux := chest(3);
				chest(3 downto 1) := chest(2 downto 0);
				chest(0) := aux;
			end loop;
		end loop;
		mode <= '1';
		wait;
	end process pwork;
end arch;
