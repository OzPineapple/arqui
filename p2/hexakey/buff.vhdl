library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity buff is
	port(
		clock:	in std_logic;
		enable:	in std_logic;
		read:	in std_logic;
		code:	in std_logic_vector( 3 downto 0 );
		memo:	out std_logic_vector( 31 downto 0 )
	);
end buff;

architecture arch of buff is
	signal chest: std_logic_vector( 31 downto 0 );
begin
	pbuff: process( clock )
		variable counter: integer;
	begin
		if( clock'event and clock = '1' ) then
			if( enable = '0' ) then
				counter := 0;
				chest <= (others => '0');
				memo <= (others => '0');
			else
				if( read = '1' ) then
					if( counter = 8 ) then
						counter := 0;
					end if;
					chest( (31 - (counter*4) ) downto (28 - (counter*4)) ) <= code;
					memo <= chest;
					counter := counter + 1;
				end if;
			end if;
		end if;
	end process pbuff;
end arch;
