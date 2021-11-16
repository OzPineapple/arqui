library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reader is
	port(
		clock:	in		std_logic;
		enable:	in		std_logic;
		adress:	inout	std_logic_vector(5 downto 0)
	);
end reader;

architecture arch of reader is
begin
	padress: process(clock)
	begin
	if( clock'event and clock = '1' ) then
		case enable is
			when '0' =>
				adress <= (others => '0');
			when '1' =>
				if( adress < "100000" ) then
					adress <= adress + '1';
				else
					adress <= adress;
				end if;
			when others => null;
		end case;
	end if;
	end process padress;
end arch;
