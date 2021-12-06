
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagebcd00.all;

entity test is
end test;

architecture arch of test is
	component bcd00 is
		  port(
			   clk0: inout std_logic;
			   clk1: inout std_logic;
			   cdiv0: in std_logic_vector(4 downto 0);
			   cdiv01: in std_logic_vector(4 downto 0);
			   reset0: in std_logic;
			   enable0: in std_logic;
			   inData0: in std_logic_vector(7 downto 0);
			   --soutFlagI120: out std_logic;--
			   soutFlagITER0: inout std_logic;
			   soutFlagAC8: inout std_logic;
			   soutFlagAC12: inout std_logic;
			   outpc0: inout std_logic_vector(3 downto 0);
			   outCode0: inout std_logic_vector(3 downto 0);
			   outFlagpc0: inout std_logic;
			   outFlagCode0: inout std_logic;
			   outFlagch0: inout std_logic;
			   outContIter0: inout std_logic_vector(3 downto 0);
			   outFlagIterA0: inout std_logic; -- se pone en '1' cuando Iteraciones alcanza 8
			   outFlagIterB0: inout std_logic; -- indica inicialización del proceso y sale de Iteraciones
			   outAC12LED0: out std_logic_vector(11 downto 0);
			   outAC80: inout std_logic_vector(7 downto 0);
			   F1F2F30: out std_logic_vector(2 downto 0);
			   outTransist0: inout std_logic_vector(3 downto 0);
			   outBCD0: out std_logic_vector(6 downto 0)
		   );
	end component;
	signal clk0: std_logic;
	signal clk1: std_logic;
	signal cdiv0: std_logic_vector(4 downto 0);
	signal cdiv01: std_logic_vector(4 downto 0);
	signal reset0: std_logic;
	signal enable0: std_logic;
	signal inData0: std_logic_vector(7 downto 0);
	-- signal soutFlagI120: std_logic;--
	signal soutFlagITER0: std_logic;
	signal soutFlagAC8: std_logic;
	signal soutFlagAC12: std_logic;
	signal outpc0: std_logic_vector(3 downto 0);
	signal outCode0: std_logic_vector(3 downto 0);
	signal outFlagpc0: std_logic;
	signal outFlagCode0: std_logic;
	signal outFlagch0: std_logic;
	signal outContIter0: std_logic_vector(3 downto 0);
	signal outFlagIterA0: std_logic; -- se pone en '1' cuando Iteraciones alcanza 8
	signal outFlagIterB0: std_logic; -- indica inicialización del proceso y sale de Iteraciones
	signal outAC12LED0: std_logic_vector(11 downto 0);
	signal outAC80: std_logic_vector(7 downto 0);
	signal F1F2F30: std_logic_vector(2 downto 0);
	signal outTransist0: std_logic_vector(3 downto 0);
	signal outBCD0: std_logic_vector(6 downto 0 );
	constant period: time := 4 ns;
begin
	pclock0: process
	begin
		clk0 <= '0';
		wait for period/2;
		clk0 <= '1';
		wait for period/2;
	end process pclock0;

	pclock1: process
	begin
		clk1 <= '0';
		wait for period;
		clk1 <= '1';
		wait for period;
	end process pclock1;

	pcontrol: process
	begin
		enable <= '0';
		reset <= '0';
		wait for period * 2;
		reset <= '1';
		enable <= '0';
		wait for period;
		reset <= '1';
		enable <= 'r';
		wait;
	end process pcontrol;
end arch;
