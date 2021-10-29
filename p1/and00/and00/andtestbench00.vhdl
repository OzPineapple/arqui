library ieee;
use ieee.std_logic_1164.all;

entity andtestbench00 is
end andtestbench00;

architecture andtestbench0 of andtestbench00 is
component and00
	port(
		Aa: in std_logic_vector(7 downto 0);
		Ba: in std_logic_vector(7 downto 0);
		Ya: out std_logic_vector(7 downto 0)
	);
end component;

signal sAa:std_logic_vector(7 downto 0);
signal sBa:std_logic_vector(7 downto 0);
signal sYa:std_logic_vector(7 downto 0);

begin
	A00: and00 port map(
		Aa => sAa,
		Ba => sBa,
		Ya => sYa
	);
	estimulos:process
	begin
		sAa <= "00000011";
		sBa <= "11000011";
		wait for 20 ns;
		---------------------------------
		sAa <= "11000011";
		sBa <= "11000000";
		wait for 20 ns;
		---------------------------------
		sAa <= "11000011";
		sBa <= "11000011";
		wait for 20 ns;
		---------------------------------
		sAa <= "00111100";
		sBa <= "00110000";
		wait for 20 ns;
		---------------------------------
		sAa <= "00110000";
		sBa <= "00111100";
		wait for 20 ns;
		---------------------------------
		sAa <= "00111100";
		sBa <= "00111100";
		wait for 20 ns;
	end process;
end andtestbench0;