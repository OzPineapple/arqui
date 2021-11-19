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
		code:	out		std_logic_vector(6 downto 0);
		count:	inout	std_logic_vector(5 downto 0);
		flag:	inout	std_logic
	);
end coder;

architecture arch of coder is
	signal control: std_logic_vector(1 downto 0);
	type matrix is array(0 to 4, 0 to 3) of std_logic_vector(6 downto 0);
	constant chars:	matrix:=( 
		("0000000","0000000","0000000","0000000"),
		("0110000","0110001","0110011","0110110"),
		("0110110","0110111","0111001","0111100"),
		("0111100","0111101","0111111","1000010"),
		("1000010","1000011","1000101","1001000")
	);
begin
	control <= (reset)&(mode);
	pcoder: process(clock)
		variable press:	bit;
		variable x:		integer;
		variable y:		integer;
	begin
		if(clock'event and clock = '1' ) then
			case control is
				when "00" =>
					code	<= "0000000";
					count	<= "000000";
					flag	<= '0';
					press	:= '0';
				when "10" =>
					x := 0; y := 0;
					case key is
						when "0000" => x:= 0;
						when "0001" => x:= 1;
						when "0010" => x:= 2;
						when "0100" => x:= 3;
						when "1000" => x:= 4;
						when others => x:= 0;
					end case;
					case ring is
						when "0000" => y:= 0;
						when "0001" => y:= 0;
						when "0010" => y:= 1;
						when "0100" => y:= 2;
						when "1000" => y:= 3;
						when others => y:= 0;
					end case;
					if ( key = "0000" ) then press:='0';
					else
						if (press ='0') then
							press:='1';
							count <= count + 1;
							flag  <= '1';
							code  <= chars(x,y);
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
