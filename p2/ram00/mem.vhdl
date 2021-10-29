library ieee;
use ieee.std_logic_1164.all;

entity mem is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		rwmode:		in		std_logic;
		wordin:		in		std_logic_vector(6 downto 0);
		count:		in		std_logic_vector(5 downto 0);
		wordout:	in		std_logic_vector(6 downto 0);
	);
end mem;

architecture arch of mem is
begin
end arch;
