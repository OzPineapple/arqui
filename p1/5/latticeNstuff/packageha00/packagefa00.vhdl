library ieee;
use ieee.std_logic_1164;

package packagefa00 is
	component ha00
		port(
			A0: in std_logic;
			BO: in std_logic;
			SO: out std_logic;
			CO: out std_logic
		);
	end component;

	component orao00
		port(
			Aao: in std_logic;
			Bao: in std_logic;
			Yao: out std_logic
		);
	end component;
end packagefa00;

