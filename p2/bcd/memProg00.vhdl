library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memProg00 is
port(
    clkPM: in std_logic;
	inFlagPM: in std_logic ;
	outFlagPM: out std_logic ;
	inPCPM: in std_logic_vector ( 3 downto 0 );
	outcodePM: out std_logic_vector(3 downto 0));
end memProg00;

architecture memProg0 of memProg00 is
type arrayrom is array(0 TO 16) OF std_logic_vector(3 downto 0);
constant memrom: arrayrom:= ("0000",
                             "0001",
                             "0010",
			                 "0011",
			                 "0100",
			                 "0101",
			                 "0110",
			                 others => "0000");
begin
  mprog: process(clkPM, inFlagPM, inPCPM)
    begin
	if (clkPM'event and clkPM = '1') then
         if (inFlagPM = '1') then
             outcodePM <= memrom(conv_integer(inPCPM));
             outFlagPM <= '1';
         elsif (inFlagPM = '0') then 
             outFlagPM <= '0';
         end if;
	end if;
    end process mprog;
end memProg0;