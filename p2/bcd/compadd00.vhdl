library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity compadd00 is
  port(
       clkca: in std_logic;
	   opcodeca: in std_logic_vector(3 downto 0);
	   inAC12ca: in std_logic_vector(11 downto 0);
	   inFlagca: in std_logic;
	   outAC12ca: out std_logic_vector(11 downto 0);
       outFlagAC12ca: out std_logic);
end compadd00;

architecture compadd0 of compadd00 is
signal snibb00, snibb01, snibb02: std_logic_vector(3 downto 0);
begin
  pcompadd: process(clkca)
  variable aux: bit:='0';
  begin
    if (clkca'event and clkca = '1') then
	  if (opcodeca = "0011") then
	    case inFlagca is
		  when '1' =>
            outFlagAC12ca <= '0';
			aux:='0';
 ------------------------------------------------------
			if (inAC12ca(3 downto 0) > "0100") then
			  snibb00 <= inAC12ca(3 downto 0) + "0011";
			else
			  snibb00 <= inAC12ca(3 downto 0);
			end if;
 ------------------------------------------------------
			if (inAC12ca(7 downto 4) > "0100") then
			  snibb01 <= inAC12ca(7 downto 4) + "0011";
			else
			  snibb01 <= inAC12ca(7 downto 4);
			end if;
 ------------------------------------------------------
			if (inAC12ca(11 downto 8) > "0100") then
			  snibb02 <= inAC12ca(11 downto 8) + "0011";
			else
			  snibb02 <= inAC12ca(11 downto 8);
			end if;
 ------------------------------------------------------
		  when '0' =>
		    if (aux = '0') then
			  aux:='1';
			  outAC12ca <= (snibb02)&(snibb01)&(snibb00);
			  outFlagAC12ca <= '1';
			end if;
 -----------------------------------------------------------
		  when others => null;
		end case;
	  else
	    aux:='0';
		outAC12ca <= (others => 'Z');
		outFlagAC12ca <= 'Z';
	  end if;
	end if;
  end process pcompadd;
end compadd0;