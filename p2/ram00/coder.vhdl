library ieee;
use ieee.std_logic_1164;

entity coder is
	port(
		clock:	in		std_logic;
		reset:	in		std_logic;
		rwmode:	in		std_logic;
		key:	in		std_logic_vector(3 downto 0);
		ring:	in		std_logic_vector(3 downto 0);
		word:	out		std_logic_vector(6 downto 0);
		count:	inout	std_logic_vector(5 downto 0);
		flag:	out		std_logic
	);
end coder;

architecture arch of coder is
	signal control: std_logic_vector(1 downto 0);
begin
	control <= (reset)&(rwmode);
	pcoder: process(clock)
	begin
		if(clock'event and clock = '1' ) then
			case control is
				-- BITS DE CONTROL
				when "00" =>
					word  <= "1111111";
					count <= "00000";
					floag <= '0';
					aux0:='0';
				when "01" =>
				-- MOOD DE ESCRITURA
				when "10" =>
					case ring is
						when "1000" => 
							case key is
								when "0000" =>
									aux0:='0'
								when "0001" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; -- 1
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0010" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --2 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0100" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --3 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "1000" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --A --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when others => null;
							end case;
						when "0100" => 
							case key is
								when "0000" =>
									aux0:='0'
								when "0001" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --5 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0010" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --6 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0100" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --b --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "1000" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --C --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when others => null;
							end case;
						when "0010" => 
							case key is
								when "0000" =>
									aux0:='0'
								when "0001" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --9 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0010" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --8 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0100" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --7 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "1000" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --+ --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when others => null;
							end case;
						when "0001" => 
							case key is
								when "0000" =>
									aux0:='0'
								when "0001" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --1 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0010" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --2 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "0100" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --3 --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when "1000" =>
									if( aux0 = '0' ) then
										aux0 := '1';
										word <= "100111"; --A --tmp
										count <= count + '1';
										flag <= '1';
									else
										count <= count;
										flag <= 0;
									end if;
								when others => null;
							end case;
						when others => null;
				when others => null;
			end case;
		end if;
	end process pcoder;
end arch;
