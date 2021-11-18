library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity coder is
	port(
		clock:	in		std_logic;
		reset:	in		std_logic;
		mode:	in		std_logic;
		key:	in		std_logic_vector(3 downto 0);
		ring:	in		std_logic_vector(3 downto 0);
		word:	out		std_logic_vector(6 downto 0);
		count:	inout	std_logic_vector(5 downto 0);
		flag:	out		std_logic
	);
end coder;

architecture arch of coder is
	signal control: std_logic_vector(1 downto 0);
	type matrix is array(0 to 4, 0 to 3) of std_logic_vector(6 downto 0);
	constant chars:	matrix:=( 
		("0110000","0110001","0110011","0110110"),
		("0110110","0110111","0111001","0111100"),
		("0111100","0111101","0111111","1000010"),
		("1000010","1000011","1000101","1001000"),
		("0000000","0000000","0000000","0000000")
	);
begin
	control <= (reset)&(mode);
	pcoder: process(clock)
		variable checkR:	std_logic_vector(3 downto 0):="0001";
		variable checkK:	std_logic_vector(3 downto 0):="0001";
		variable press:		bit:='0';
		variable coordR:	integer:=0;
		variable coordK:	integer:=0;
	begin
		if(clock'event and clock = '1' ) then
			case control is
				when "00" =>
					word	<= "1111111";
					count	<= "000000";
					flag	<= '0';
					press	:= '0';
				when "10" =>
					checkR  := "0001";
					checkK  := "0001";
					coordR := 0;
					coordK := 0;
					for i in 0 to 3 loop
						if( checkR = ring ) then
							report "Found equal R";
							exit;
						end if;
						checkR := checkR sll 1;
						coordR := coordR + 1;
					end loop;
					for i in 0 to 3 loop
						if( checkK = key ) then
							report "Found equal K";
							exit;
						end if;
						checkK := checkK sll 1;
						coordK := coordK + 1;
					end loop;
					if ( key = "0000" ) then
						press:='0';
					else
						if (press ='0') then
							press:='1';
							count <= count + 1;
							flag  <= '1';
							word  <= chars(coordR,coordK);
						else
							count <= count;
							flag  <= '0';
						end if;
					end if;
				when others => null;
			end case;
		end if;
	end process pcoder;
end arch;
