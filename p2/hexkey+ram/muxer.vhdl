library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;

entity muxer is
	port(
		reset:		in		std_logic;
		mode:		in		std_logic;
		code:		in		std_logic_vector(3 downto 0);
		ram:		in		std_logic_vector(7 downto 0);
		data:		out		std_logic_vector(7 downto 0)
	);
end muxer;

architecture arch of muxer is
	signal control: std_logic_vector(1 downto 0);
begin
	control <= (reset)&(mode);
	with control select data <=
		ram					when "11",
		("0000")&(code)		when "10",
		"00000000"			when others;
end arch;
