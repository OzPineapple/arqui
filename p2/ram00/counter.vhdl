library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity countRead  is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic; -- Read / Write
		count:		in		std_logic_vector(5 downto 0);
		read:		inout	std_logic_vector(5 downto 0)
	);
end countRead;

architecture arch of countRead is
	signal scontrolcr: std_logic_vector(1 downto 0);
begin
	pcount: process(clock)
	begin
		if(clock'event and clock = '1') then
			case scontrolcr is
				when "00" => 
					read <= "000000";
				when "11" => 
					if( read < count ) then
						read <= read + '1';
					else
						read <= read;
					end if;
				when others => null;
			end case;
		end if;
	end process pcount;
end arch;
