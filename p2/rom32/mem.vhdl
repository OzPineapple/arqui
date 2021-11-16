library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mem is
	port(
		--clock:	in		std_logic;
		--enable:	in		std_logic;
		adress:	in		std_logic_vector(5 downto 0);
		data:	out		std_logic_vector(31 downto 0)
	);
end mem;

architecture arch of mem is
	type arrayrom is array(0 to 63) of std_logic_vector(7 downto 0);
	constant	wordrom:	arrayrom:=(
		"00110001", -- 1
		"00110010", -- 2
		"00110011", -- 3
		"00110100", -- 4
		"00110101", -- 5
		"00110110", -- 6
		"00110111", -- 7
		"00111000", -- 8
		"00111001", -- 9
		"00111010", -- :
		"00111011", -- ;
		"00111100", -- <
		"00111101", -- =
		"00111110", -- >
		"00111111", -- ?
		"01000000", -- @
		"01000001", -- A
		"01000010", -- B
		"01000011", -- C
		"01000100", -- D
		"01000101", -- E
		"01000110", -- F
		"01000111", -- G
		"01001000", -- H
		"01001001", -- I
		"01001010", -- J
		"01001011", -- K
		"01001100", -- L
		"01001101", -- M
		"01001110", -- N
		"01001111", -- O
		"01010000", -- P
		"01010001", -- Q
		"01010010", -- R
		"01010011", -- S
		"01010100", -- T
		"01010101", -- U
		"01010110", -- V
		"01010111", -- W
		"01011000", -- X
		"01011001", -- Y
		"01011010", -- Z
		"01011011", -- [
		"01011100", -- \
		"01011101", -- ]
		"01011110", -- ^
		"01011111", -- _
		"01100000", -- `
		"01100001", -- a
		"01100010", -- b
		"01100011", -- c
		"01100100", -- d
		"01100101", -- e
		"01100110", -- f
		"01100111", -- g
		"01101000", -- h
		"01101001", -- i
		"01101010", -- j
		"01101011", -- k
		"01101100", -- l
		"01101101", -- m
		"01101110", -- n
		"01101111", -- o
		"01110000", -- p
		others => "11111111"
	);
begin
	prom: process(adress)
	begin
		data <= wordrom( conv_integer(adress) ) &
				wordrom( conv_integer(adress + 1)) &
				wordrom( conv_integer(adress + 2)) &
				wordrom( conv_integer(adress + 3)) ;
	end process;
end arch;
