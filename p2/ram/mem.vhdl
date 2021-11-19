library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mem is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		mode:		in		std_logic;
		flag:		in		std_logic;
		code:		in		std_logic_vector(6 downto 0);
		adress:		in		std_logic_vector(5 downto 0);
		count:		in		std_logic_vector(5 downto 0);
		data:		out		std_logic_vector(6 downto 0)
	);
end mem;

architecture arch of mem is
	type blocks is array (0 to 63) of std_logic_vector(6 downto 0);
	signal memo: blocks;
	signal control: std_logic_vector(1 downto 0);
begin
	control <= (reset)&(mode);	
	pram: process(clock)
	begin
		if(clock'event and clock = '1') then
			case control is
				when "00" =>
					data <= "0000000";
				when "01" =>
					data <= "0000000";
				when "10" =>
					if(flag = '1') then
						memo(0) <= "0000000";
						memo(1) <= "0000000";
						memo(63) <= "0000000";
						memo( conv_integer(count) ) <= code;
					end if;
				when "11" =>
					data <= memo( conv_integer(adress) );
				when others => null;
			end case;
		end if;
	end process pram;
end arch;
