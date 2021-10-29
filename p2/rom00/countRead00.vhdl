library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contRead00 is
	port(
		clock:	in		std_logic;
		enable:	in		std_logic;
		count:	inout	std_logic_vector(4 downto 0)
	);
end contRead00;

architecture arch of contRead00 is
begin
	pcount: process(clock)
	begin
	if( clock'event and clock = '1' ) then
		case enable is
			when '0' =>
				ocont <= (others => '0');
			when '1' =>
				if( count < "10000" ) then
					count <= count + '1';
				else
					count <= count;
				end if;
			when others => null;
		end case;
	end if;
	end pcount;
end arch;
