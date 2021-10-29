library ieee;
use ieee.std_logic_1164.all;
use work.packagekey.all;

entity key is
	port(
		clock:		in		std_logic;
		enable:		in		std_logic;
		inkey:		in		std_logic_vector(3 downto 0);
		outcoder:	out		std_logic_vector(6 downto 0);
		outring:	inout	std_logic_vector(3 downto 0)
		outtrans:	out		std_logic_vector(5 downto 0);
	);
end key;

architecture arch of key is
begin
	outtrans <= "111110";
	K01: countring	port map( clock => clock, enable => enable, outring => outring );	
	K02: coder		port map( clock => clock, inkey => inkey, incoder => outring, outcoder => outcoder );
end arch;
