library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reader  is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic; -- Read / Write
		count:		in		std_logic_vector(5 downto 0);
		adress:		inout	std_logic_vector(5 downto 0)
	);
end reader;

architecture arch of reader is
	signal control: std_logic_vector(1 downto 0);
begin
	control <= (reset)&(mode);
	pcount: process(clock)
	begin
		if(clock'event and clock = '1') then
			case control is
				when "00" => 
					adress <= "000000";
				when "11" => 
					if( adress < count ) then
						adress <= adress + '1';
					else
						adress <= adress;
					end if;
				when others => null;
			end case;
		end if;
	end process pcount;
end arch;
