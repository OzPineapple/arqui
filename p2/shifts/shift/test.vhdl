library ieee;
library work;
use ieee.std_logic_1164.all;
use work.packageshift.all;

entity test is
end test;

architecture arch of test is
	signal sclk: std_logic;
	signal sens: std_logic;

	signal sin: std_logic_vector(7 downto 0);

	signal sin0: std_logic_vector(7 downto 0);
	signal sin1: std_logic_vector(7 downto 0);
	signal sin2: std_logic_vector(7 downto 0);
	signal sin3: std_logic_vector(7 downto 0);

	signal o_rl:	std_logic_vector(7 downto 0);
	signal o_lr:	std_logic_vector(7 downto 0);
	signal o_r_rl:	std_logic_vector(7 downto 0);
	signal o_r_lr:	std_logic_vector(7 downto 0);

	constant period:	time := 2 ns;
begin

	con0: shift_rl		port map( clks => sclk, ens => sens, ins => sin0, outs => o_rl	  );
	con1: shift_lr		port map( clks => sclk, ens => sens, ins => sin1, outs => o_lr	  );
	con2: shift_r_rl	port map( clks => sclk, ens => sens, ins => sin2, outs => o_r_rl );
	con3: shift_r_lr	port map( clks => sclk, ens => sens, ins => sin3, outs => o_r_lr );

	sin <= "11000011";
	
	sin0 <= sin;
	sin1 <= sin;
	sin2 <= sin;
	sin3 <= sin;
	
	clk: process
	begin
		sclk <= '0';
		wait for period/2;
		sclk <= '1';
		wait for period/2;
	end process;

	init: process
	begin
		sens <= '0';
		wait for period;
		sens <= '1';
		wait;
	end process;
end arch;
