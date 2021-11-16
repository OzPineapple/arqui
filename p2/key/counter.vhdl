library ieee;
use ieee.std_logic_1164.all;

entity counter is
	port(
		clock:	in	std_logic;
		enable:	in	std_logic;
		ring:	out	std_logic_vector(3 downto 0)
	);
end counter;

architecture arch of counter is
	signal sshift: std_logic_vector(3 downto 0);
begin
	pcount: process(clock)
	begin
		if( clock'event and clock = '1' ) then
			case enable is
				when '0' =>
					ring <= (others => '0');
					sshift <= "0001";
				when '1' =>
					sshift(3) <= sshift(0);
					sshift(2 downto 0) <= sshift(3 downto 1);
					ring <= sshift;
				when others => null;
			end case;
		end if;
	end process pcount;
end arch;
