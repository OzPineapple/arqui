library ieee;
use ieee.std_logic_1164.all;

package packageword is
	component counter is
	port(
		clock:	in	std_logic;
		enable:	in	std_logic;
		ring:	out	std_logic_vector(5 downto 0)
	);
	end component;

	component coder is
	port(
		ring:	in	std_logic_vector(5 downto 0);
		code:	out	std_logic_vector(6 downto 0)
	);
	end component;
end package;
