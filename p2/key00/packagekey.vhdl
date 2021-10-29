library ieee;
use ieee.std_logic_1164.all;

package packagekey is
	component countring is
		port(
			clock:	in	std_logic;
			enr:	in	std_logic;
			outr:	out	std_logic_vector(3 downto 0)
		);
	end component;
	component coder is
		port(
			clock:		in	std_logic;
			incountr:	in	std_logic_vector(3 downto 0);
		);
	end component;
end packagekey;
