library ieee;
use ieee.std_logic_1164.all;

entity keyboard is
	port(
		clock:	in		std_logic;
		enable:	in		std_logic;
		key:	in		std_logic_vector(3 downto 0);
		ring:	inout	std_logic_vector(3 downto 0);
		code:	out		std_logic_vector(7 downto 0)
	);
end keyboard;

architecture arch of keyboard is
	component counter is
		port(
			clock:	in	std_logic;
			enable:	in	std_logic;
			ring:	out	std_logic_vector(3 downto 0)
		);
	end component;
	component coder is
		port(
			clock:	in	std_logic;
			ring:	in	std_logic_vector(3 downto 0);
			key:	in	std_logic_vector(3 downto 0);
			code:	out	std_logic_vector(7 downto 0)
		);
	end component;
begin
	con0: counter	port map( clock => clock, enable => enable, ring => ring );	
	con1: coder port map( clock => clock, ring => ring, key => key, code => code );
end arch;
