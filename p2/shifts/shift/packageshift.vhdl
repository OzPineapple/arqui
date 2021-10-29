library ieee;
use ieee.std_logic_1164.all;

package packageshift is
	component shift_rl is
		port(
			clks:	in	std_logic;
			ens:	in	std_logic;
			ins:	in	std_logic_vector(7 downto 0);
			outs:	out	std_logic_vector(7 downto 0)
		);
	end component;
	component shift_lr is
		port(
			clks:	in	std_logic;
			ens:	in	std_logic;
			ins:	in	std_logic_vector(7 downto 0);
			outs:	out	std_logic_vector(7 downto 0)
		);
	end component;
	component shift_r_rl is
		port(
			clks:	in	std_logic;
			ens:	in	std_logic;
			ins:	in	std_logic_vector(7 downto 0);
			outs:	out	std_logic_vector(7 downto 0)
		);
	end component;
	component shift_r_lr is
		port(
			clks:	in	std_logic;
			ens:	in	std_logic;
			ins:	in	std_logic_vector(7 downto 0);
			outs:	out	std_logic_vector(7 downto 0)
		);
	end component;
end package;
