library ieee;
library work;
use ieee.std_logic_1164.all;
use work.packageram.all;

entity ram is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic;
		key:		in		std_logic_vector(3 downto 0);
		ring:		inout	std_logic_vector(3 downto 0);
		count:		inout	std_logic_vector(5 downto 0);
		adress:		inout	std_logic_vector(5 downto 0);
		display:	out		std_logic_vector(6 downto 0);
		flag:		inout	std_logic
	);
end ram;

architecture arch of ram is
	signal wordcoder:	std_logic_vector(6 downto 0);
	signal wordram:		std_logic_vector(6 downto 0);
begin
	con0: ringer	port map( clock => clock, reset => reset, mode => mode, ring => ring);
	con1: coder		port map( clock => clock, reset => reset, mode => mode, key => key, ring => ring, count => count, flag => flag, code => wordcoder);
	con2: reader	port map( clock => clock, reset => reset, mode => mode, count => count, adress => adress);
	con3: mem		port map( clock => clock, reset => reset, mode => mode, count => count, adress => adress, flag => flag, code => wordcoder, data => wordram);
	con4: muxer		port map(                 reset => reset, mode => mode, code => wordcoder, ram => wordram, data => display );
end arch;
