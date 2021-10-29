library ieee;
use ieee.std_logic_1164.all;

entity countring is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		ring:		inout	std_logic_vector(3 downto 0)
	);
end countring;

architecture arch of countring is
	signal sshift:	std_logic_vector(3 downto 0);
begin
	pshift: process()
	begin
		if(clock'event and clock = '1' ) then
			case reset is
				when '0' =>
					ring <= "0000";
					sshift <= "1000";
				when '1' =>
					sshift(3) <= sshift(0);
					sshift(2 downto 0) <= sshift(3 downto 1);
					ring <= sshift;
				when others => null;
			end case;
		end if;
	end process pshift;
end arch;
