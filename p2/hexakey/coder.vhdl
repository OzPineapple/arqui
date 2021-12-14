library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity coder is
	port(
		clock:	in		std_logic;
		press:	inout	std_logic;
		key:	in		std_logic_vector(3 downto 0);
		ring:	in		std_logic_vector(3 downto 0);
		code:	out		std_logic_vector(3 downto 0)
	);
end coder;

architecture arch of coder is
	signal control: std_logic_vector(1 downto 0);
	type matrix is array(0 to 4, 0 to 3) of std_logic_vector(3 downto 0);
	constant chars:	matrix:=( 
		("0000","0000","0000","0000"),
		("0000","0001","0010","0011"),
		("0100","0101","0110","0111"),
		("1000","1001","1010","1011"),
		("1100","1101","1110","1111")
	);
begin
	pcoder: process(clock)
		variable x:		integer;
		variable y:		integer;
	begin
		if(clock'event and clock = '1' ) then
			x := 0; y := 0;
			case key is
				when "0000" => x:= 0;
				when "0001" => x:= 1;
				when "0010" => x:= 2;
				when "0100" => x:= 3;
				when "1000" => x:= 4;
				when others => x:= 0;
			end case;
			case ring is
				when "0000" => y:= 0;
				when "0001" => y:= 0;
				when "0010" => y:= 1;
				when "0100" => y:= 2;
				when "1000" => y:= 3;
				when others => y:= 0;
			end case;
			if ( key = "0000" ) then press <= '0';
			else
				if (press = '0') then
					press <= '1';
					code  <= chars(x,y);
				else
					press <= '0';
				end if;
			end if;
		end if;
	end process pcoder;
end arch;
