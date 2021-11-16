library ieee;
use ieee.std_logic_1164.all;

entity rom is
	port(
		enable:		in		std_logic;
		clock:		in		std_logic;
		adress:		inout	std_logic_vector(4 downto 0);
		data:		out		std_logic_vector(6 downto 0)
	);
end rom;

architecture arch of rom is
	component reader is
		port(
			clock:	in		std_logic;
			enable:	in		std_logic;
			adress:	inout	std_logic_vector(4 downto 0)
		);
	end component;
	component mem is
		port(
			adress:	in		std_logic_vector(4 downto 0);
			data:	out		std_logic_vector(6 downto 0)
		);
	end component;
begin
	con0: reader	port map( clock => clock, enable => enable, adress => adress );
	con1: mem		port map( adress => adress, data =>  data );
end arch;
