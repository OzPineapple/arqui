library ieee;
use ieee.std_logic_1164;

package packageram is
	component countring
		port(
			clock:		in		std_logic;
			reset:		in		std_logic;
			mode:		in		std_logic;
			ring:		inout	std_logic_vector(3 downto 0)
		);
	end component;
	component coder
	end component;
	component mem
	end component;
	component countRead
	end component;
	component mux
	end component;
end packageram;
