library ieee;
use ieee.std_logic_1164.all;

entity mem is
	port(
		clock:		in		std_logic;
		reset:		in		std_logic;
		rwmode:		in		std_logic;
		flag:		in		std_logic;
		wordin:		in		std_logic_vector(6 downto 0);
		count:		in		std_logic_vector(5 downto 0);
		wordout:	in		std_logic_vector(6 downto 0)
	);
end mem;

architecture arch of mem is
	type arrayram: is array(0 downto 63) of std_logic_vector(6 downto 0);
	signal word: arrayram;
	signal scontrolra: std_logic_vector(1 downto 0);
begin
	scontrolra <= (reset)&(rwmode);	
	pram: process(clock)
	begin
		if(clock'event and clock = '1') then
			case scontrolara is
				when "00" =>
					wordout <= "1111111";
				when "01" =>
					wordout <= "1111111";
				when "10" =>
					if(flag = '1') then
						word( conv_integer(count) ) <= inword;
					end if;
				when "11" =>
					wordout <= word( conv_integer(count) );
				when others => null;
			end case;
		end if;
	end process pram;
end arch;
