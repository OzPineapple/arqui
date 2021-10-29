library ieee;
library work;
use ieee.std_logic_1164.all;
use work.packageword.all;

entity word is
	port(
		clock:		inout	std_logic;
		enable:		in		std_logic;
		code:		out		std_logic_vector(6 downto 0);
		ring:		out		std_logic_vector(5 downto 0)
	);
end word;

architecture arch of word is
	signal bridge:	std_logic_vector(5 downto 0);
begin
	con0: counter	port map( clock => clock,  enable => enable, ring => bridge );
	con1: coder		port map( ring  => bridge, code   => code );
	ring <= bridge;
end arch;
