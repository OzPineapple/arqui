library ieee;
use ieee.std_logic_1164.all;

package packageram is
	component ringer is
		port(
			clock:		in		std_logic;
			reset:		in		std_logic;
			mode:		in		std_logic;
			ring:		inout	std_logic_vector(3 downto 0)
		);
	end component;
	component coder is
		port(
			clock:	in		std_logic;
			reset:	in		std_logic;
			mode:	in		std_logic;
			key:	in		std_logic_vector(3 downto 0);
			ring:	in		std_logic_vector(3 downto 0);
			code:	out		std_logic_vector(3 downto 0);
			count:	inout	std_logic_vector(6 downto 0);
			nibble:	inout	std_logic;
			flag:	inout	std_logic
		);
	end component;
	component reader is
		port(
			clock:		in		std_logic;
			reset:		in		std_logic;
			mode:		in		std_logic;
			count:		in		std_logic_vector(6 downto 0);
			adress:		inout	std_logic_vector(5 downto 0)
		);
	end component;
	component mem is
		port(
			clock:		in		std_logic;
			reset:		in		std_logic;
			mode:		in		std_logic;
			flag:		in		std_logic;
			nibble:		in		std_logic;
			code:		in		std_logic_vector(3 downto 0);
			adress:		in		std_logic_vector(5 downto 0);
			count:		in		std_logic_vector(6 downto 0);
			data:		out		std_logic_vector(7 downto 0)
		);
	end component;
	component muxer is
		port(
			reset:		in		std_logic;
			mode:		in		std_logic;
			code:		in		std_logic_vector(3 downto 0);
			ram:		in		std_logic_vector(7 downto 0);
			data:		out		std_logic_vector(7 downto 0)
		);
	end component;
end packageram;
