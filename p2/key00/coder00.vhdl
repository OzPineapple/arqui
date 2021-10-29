library ieee;
use ieee.std_logic_1164.all;

entity coder00 is
	port(
		clock:		in	std_logic;
		incontc:	in	std_logic_vector(5 downto 0);
		outcoderc:	out	std_logic_vector(6 downto 0)
	);
end coder00;

architecture coder0 of coder00 is
begin
	if( clock'event = '1' ) then
	when "0100" =>
		case inkeyc is
			when "0000" =>
				aux := '0';
			when "0001" =>
				if( aux = '0' ) then
					aux := '1';
					outcoderc <= "11000000"; -- 6
				end if
			when "0001" =>
				if( aux = '0' ) then
					aux := '1';
					outcoderc <= "11000000"; -- 6
				end if
	with incontc select
		outcoderc <= "1001000" when "011111",
		"0000001" when "001111",
		"1110001" when "000111",
		"0001000" when "000011",
		"1111111" when others;
	end if;
end coder0;
