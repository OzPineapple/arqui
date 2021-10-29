library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
-- use ieee.std_logic_unsigned.all;

entity mem is
	port(
		clock:	in		std_logic;
		enable:	in		std_logic;
		count:	in		std_logic_vector(5 downto 0);
		outrom:	out		std_logic_vector(31 downto 0)
	);
end mem;

architecture arch of mem is
	type arrayrom is array(0 to 63) of std_logic_vector(7 downto 0);
	constant	wordrom:	arrayrom:=(
	-- Cambiar a 8 bits
	"0000001", --0
	"1001111", --1
	"0010011", --2
	"0010011", --2
	-- Poner el resto
	others => "1111111"
);
begin
	prom: process(count)
	begin
		outrom <= wordrom( conv_integer(count) );
	end process;
end arch;
