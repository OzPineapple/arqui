library ieee;
use ieee.std_logic_1164.all;

entity coder is
	port(
		ring:	in	std_logic_vector(5 downto 0);
		code:	out	std_logic_vector(6 downto 0)
	);
end coder;

architecture arch of coder is
begin
	with ring select code <=
		"1000011" when "011111",
		"1000001" when "101111",
		"1001011" when "110111",
		"1000101" when "111011",
		"1111111" when others;
end arch;
