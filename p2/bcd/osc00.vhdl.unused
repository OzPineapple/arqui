library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity osc00 is
  port(
       cdiv: in std_logic_vector(4 downto 0);
	   cdiv1: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic;
	   oscout1: inout std_logic);
end osc00;

architecture osc0 of osc00 is
signal sclk: std_logic;
begin

  O00: oscint00 port map(osc_int => sclk);
  
  O01: div00 port map(clkdiv => sclk,
                      indiv => cdiv,
                      oscout => oscout0);

  O02: div01 port map(clkdiv1 => sclk,
                      indiv1 => cdiv1,
                      outdiv1 => oscout1);


end osc0;