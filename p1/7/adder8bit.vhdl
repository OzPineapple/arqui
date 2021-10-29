library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder8bit is
	port(
		sel:	in	std_logic;
		anum:	in	unsigned(7 downto 0);
		bnum:	in	unsigned(7 downto 0);
		sum:	out	unsigned(7 downto 0)
	);
end adder8bit;

architecture adder8bit_arch of adder8bit is
begin
	sum <= anum + bnum when sel = '0'
		   else anum - bnum;
end adder8bit_arch;
