library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_r_lr is
	port(
		clock:	in	std_logic;
		runer:	in	std_logic;
		count:	in	unsigned(3 downto 0);
		input:	in	std_logic_vector(7 downto 0);
		output:	out	std_logic_vector(7 downto 0)
	);
end barrel_r_lr;

architecture arch of barrel_r_lr is
	signal sbarrel: std_logic_vector(7 downto 0);
	signal scount:	unsigned(3 downto 0);
begin
	pbarrel: process(clock)
	begin
	if( clock'event and clock = '1') then
		if( runer = '0' ) then
			output	<= (others => '0');
			sbarrel	<= input;
			scount	<= count + 1;
		elsif( runer = '1' ) then
			if( scount > "0000" ) then
				sbarrel(6  downto 0) <= sbarrel(7 downto 1);
				sbarrel(7) <= sbarrel(0);
				output <= sbarrel;
				scount <= scount - 1;
			end if;
		end if;
	end if;
	end process pbarrel;
end arch;
