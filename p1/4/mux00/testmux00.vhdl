library ieee;
use ieee.std_logic_1164.all;

entity testmux00 is
end testmux00;

architecture testmux0 of testmux00 is
	signal at, bt : std_logic_vector(7 downto 0);
	signal st : std_logic_vector(3 downto 0);
	signal yt : std_logic_vector(7 downto 0);
begin
	TB : entity work.mux00 port map(at, bt, st, yt);
	at <= "00000001";
	bt <= "00100001";
	test: process
	begin
		st <= "0000"; wait for 10 ns;
		st <= "0001"; wait for 10 ns; 
		st <= "0011"; wait for 10 ns; 
		st <= "0010"; wait for 10 ns; 
		st <= "0110"; wait for 10 ns; 
		st <= "0100"; wait for 10 ns; 
		st <= "0111"; wait for 10 ns; 
		st <= "1111"; wait for 10 ns; 
		wait;
	end process;
end testmux0;