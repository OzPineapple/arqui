library ieee;
use ieee.std_logic_1164.all;

entity keyboard is
	port(
		clock:	in		std_logic;
		enable:	in		std_logic;
		key:	in		std_logic_vector(3 downto 0);
		ring:	inout	std_logic_vector(3 downto 0);
		number:	out		std_logic_vector(31 downto 0)
	);
end keyboard;

architecture arch of keyboard is
	component ringer is
		port(
			clock:	in	std_logic;
			enable:	in	std_logic;
			ring:	out	std_logic_vector(3 downto 0)
		);
	end component;
	component coder is
		port(
			clock:	in		std_logic;
			press:	inout	std_logic;
			ring:	in		std_logic_vector(3 downto 0);
			key:	in		std_logic_vector(3 downto 0);
			code:	out		std_logic_vector(3 downto 0)
		);
	end component;
	component buff is
		port(
			clock:	in std_logic;
			enable:	in std_logic;
			read:	in std_logic;
			code:	in std_logic_vector( 3 downto 0 );
			memo:	out std_logic_vector( 31 downto 0 )
		);
	end component;
	signal press: std_logic;
	signal code: std_logic_vector( 3 downto 0 );
begin
	con0: ringer	port map( clock => clock, enable => enable, ring => ring );	
	con1: coder		port map( clock => clock, press => press, ring => ring, key => key, code => code );
	con2: buff		port map( clock => clock, enable => enable, read => press, code => code, memo => number );
end arch;
