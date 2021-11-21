library ieee;
use ieee.std_logic_1164.all;

entity pile is
	port(
		clock:	in	std_logic;
		enable:	in	std_logic;
		mode:	in	std_logic;
		push:	in	std_logic_vector(7 downto 0);
		pop:	out	std_logic_vector(7 downto 0)
	);
end pile;

architecture arch of pile is
	type blocks is array (0 to 63) of std_logic_vector(7 downto 0);
	signal mem: blocks;
	signal control: std_logic_vector(1 downto 0);
begin
	control <= (enable) & (mode);
	pileP: process(clock)
		variable adress: integer;
	begin
		if( clock'event and clock = '1' ) then
			case control is
				when "00" => -- Init
					adress := 0;
					pop <= "00000000";
				when "10" => -- Write
					mem( adress ) <= push;
					adress := adress + 1;
				when "11" => -- Read
					pop <= mem( adress - 1 );
				when others => null;
			end case
		end if;
	end process pileP;
end arch;
