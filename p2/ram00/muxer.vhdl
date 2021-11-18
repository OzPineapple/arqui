library ieee;
use ieee.std_logic_1164;

entity mux is
	port(
		reset:		in		std_logic;
		mode:		in		std_logic; -- Read / Write
		coder:		in		std_logic_vector(6 downto 0);
		ram:		in		std_logic_vector(6 downto 0);
		word:		in		std_logic_vector(6 downto 0);
	);
end mux;

architecture arch of mux is
	signal control: std_logic(1 downto 0);
begin
	control <= (reset)&(mode);
	with control select
		word <= code when "10",
			   ram	when "11",
			   "1111111" when others;
end arch;
