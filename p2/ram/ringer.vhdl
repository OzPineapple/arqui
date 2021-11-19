library ieee;
use ieee.std_logic_1164.all;

entity ringer is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic;
		ring:		inout	std_logic_vector(3 downto 0)
	);
end ringer;

architecture arch of ringer is
	signal sshift:	std_logic_vector(3 downto 0);
	signal control: std_logic_vector(1 downto 0);
begin
	control <= (reset)&(mode);
	pshift: process(clock)
	begin
		if(clock'event and clock = '1' ) then
			case control is
				when "00" =>
					ring <= "0000";
					sshift <= "1000";
				when "10" =>
					sshift(3) <= sshift(0);
					sshift(2 downto 0) <= sshift(3 downto 1);
					ring <= sshift;
				when others => null;
			end case;
		end if;
	end process pshift;
end arch;
