library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.packagebarrel.all;

entity test is
end test;

architecture arch of test is
	signal sclock: std_logic;
	signal sruner: std_logic;
	signal scount: unsigned(3 downto 0);
	signal sinput: std_logic_vector(7 downto 0);

	signal o_rl:	std_logic_vector(7 downto 0);
	signal o_lr:	std_logic_vector(7 downto 0);
	signal o_r_rl:	std_logic_vector(7 downto 0);
	signal o_r_lr:	std_logic_vector(7 downto 0);

	constant period:	time := 2 ns;
begin

	con0: barrel_rl		port map( clock => sclock, runer => sruner, count => scount, input => sinput, output => o_rl	);
	con1: barrel_lr		port map( clock => sclock, runer => sruner, count => scount, input => sinput, output => o_lr	);
	con2: barrel_r_rl	port map( clock => sclock, runer => sruner, count => scount, input => sinput, output => o_r_rl	);
	con3: barrel_r_lr	port map( clock => sclock, runer => sruner, count => scount, input => sinput, output => o_r_lr	);

	sinput <= "11000011";
	scount <= "0100";
	
	clockP: process
	begin
		sclock <= '0';
		wait for period/2;
		sclock <= '1';
		wait for period/2;
	end process;

	runerP: process
	begin
		sruner <= '0';
		wait for period * 3/2;
		sruner <= '1';
		wait;
	end process;
end arch;
