library ieee;
use ieee.std_logic_1164.all;

entity coder is
	port(
		clock:	in	std_logic;
		ring:	in	std_logic_vector(3 downto 0);
		key:	in	std_logic_vector(3 downto 0);
		code:	out	std_logic_vector(7 downto 0)
	);
end coder;

architecture arch of coder is
begin
pcoder:  process(clock)
	variable press:	bit:='0';
begin
if( clock'event and clock = '1' ) then
case ring is
	when "0001" => case key is
		when "0000" => press := '0';
		when "0001" => if( press = '0' ) then
			code <= "00110111"; -- 7
		press := '1'; end if;
		when "0010" => if( press = '0' ) then
			code <= "00111000"; -- 8
		press := '1'; end if;
		when "0100" => if( press = '0' ) then
			code <= "00111001"; -- 9
		press := '1'; end if;
		when "1000" => if( press = '0' ) then
			code <= "01000001"; -- A
		press := '1'; end if;
		when others => code <= "00000000"; end case;
	when "0010" => case key is
		when "0000" => press := '0';
		when "0001" => if( press = '0' ) then
				code <= "00110100"; -- 4
		press := '1'; end if;
		when "0010" => if( press = '0' ) then
				code <= "00110101"; -- 5
		press := '1'; end if;
		when "0100" => if( press = '0' ) then
				code <= "00110110"; -- 6
		press := '1'; end if;
		when "1000" => if( press = '0' ) then
				code <= "01000010"; -- B
		press := '1'; end if;
		when others => code <= "00000000"; end case;
	when "0100" =>
		case key is
		when "0000" => press := '0';
		when "0001" => if( press = '0' ) then
				code <= "00110001"; -- 1
		press := '1'; end if;
		when "0010" => if( press = '0' ) then
				code <= "00110010"; -- 2
		press := '1'; end if;
		when "0100" => if( press = '0' ) then
				code <= "00110011"; -- 3
		press := '1'; end if;
		when "1000" => if( press = '0' ) then
				code <= "01000011"; -- C
		press := '1'; end if;
		when others => code <= "00000000"; end case;
	when "1000" =>
		case key is
		when "0000" => press := '0';
		when "0001" => if( press = '0' ) then
				code <= "00101101"; -- -
		press := '1'; end if;
		when "0010" => if( press = '0' ) then
				code <= "00111011"; -- +
		press := '1'; end if;
		when "0100" => if( press = '0' ) then
				code <= "00111010"; -- *
		press := '1'; end if;
		when "1000" => if( press = '0' ) then
				code <= "01000100"; -- D
		press := '1'; end if;
		when others => code <= "00000000"; end case;
when others => code <= "00000000";
end case;
end if;
end process pcoder;
end arch;
