library ieee;
use ieee.std_logic_1164;

entity ram is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic;
		key:		in		std_logic_vector(6 downto 0);
		write:		in		std_logic_vector(5 downto 0);
		read:		in		std_logic_vector(5 downto 0);
		ring:		out		std_logic;
		code:		out		std_logic(6 downto 0);
		flag:		out		std_logic;
		trans:	out		std_logic(5 downto 0);
	);
end ram;

architecture arch of ram is
	signal swordcoder:	std_logic_vector(6 downto 0);
	signal swordram:	std_logic_vector(6 downto 0);
begin
	trans <= "111110";
	ra01: countring port map( clock => clock, reset => reset, mode => mode, ring => ring );
	ra02: coder		port map( clock => clock, reset => reset, mode => mode, key => key,  );
	ra03: mem		port map(  );
	ra04: countRead port map();
	ra05: mux		port map();
end arch;
