library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mem is
	port(
		--clock:	in		std_logic;
		--enable:	in		std_logic;
		adress:	in		std_logic_vector(4 downto 0);
		data:	out		std_logic_vector(6 downto 0)
	);
end mem;

architecture arch of mem is
	type arrayrom is array(0 to 31) of std_logic_vector(6 downto 0);
	constant	wordrom:	arrayrom:=(
		"0110001", -- 1
		"0110010", -- 2
		"0110011", -- 3
		"0110100", -- 4
		"0110101", -- 5
		"0110110", -- 6
		"0110111", -- 7
		"0111000", -- 8
		"0111001", -- 9
		"0111010", -- :
		"0111011", -- ;
		"0111100", -- <
		"0111101", -- =
		"0111110", -- >
		"0111111", -- ?
		"1000000", -- @
		"1000001", -- A
		"1000010", -- B
		"1000011", -- C
		"1000100", -- D
		"1000101", -- E
		"1000110", -- F
		others => "1111111"
	);
begin
	prom: process(adress)
	begin
		data <= wordrom( conv_integer(adress) );
	end process;
end arch;
