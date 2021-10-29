library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package packagebarrel is
	component barrel_rl is
		port(
			clock:	in	std_logic;
			runer:	in	std_logic;
			count:	in	unsigned(3 downto 0);
			input:	in	std_logic_vector(7 downto 0);
			output:	out	std_logic_vector(7 downto 0)
		);
	end component;
	component barrel_lr is
		port(
			clock:	in	std_logic;
			runer:	in	std_logic;
			count:	in	unsigned(3 downto 0);
			input:	in	std_logic_vector(7 downto 0);
			output:	out	std_logic_vector(7 downto 0)
		);
	end component;
	component barrel_r_rl is
		port(
			clock:	in	std_logic;
			runer:	in	std_logic;
			count:	in	unsigned(3 downto 0);
			input:	in	std_logic_vector(7 downto 0);
			output:	out	std_logic_vector(7 downto 0)
		);
	end component;
	component barrel_r_lr is
		port(
			clock:	in	std_logic;
			runer:	in	std_logic;
			count:	in	unsigned(3 downto 0);
			input:	in	std_logic_vector(7 downto 0);
			output:	out	std_logic_vector(7 downto 0)
		);
	end component;
end package;
