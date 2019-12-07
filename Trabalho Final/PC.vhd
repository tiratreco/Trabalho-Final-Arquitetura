
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC is
port(
CLK	 : in std_logic;
start	 : in std_logic;
entrada	 : in std_logic_vector (15 downto 0);
salvar	 : in std_logic;
saida    : out std_logic_vector (15 downto 0));
end PC;

architecture comportamento of PC is
signal PC : std_logic_vector (15 downto 0);
begin
	saida <= PC;
	process (CLK, entrada, salvar, start)
	begin
	if (start = '1') then
		PC <= "0000000000000000";
	end if;
	if (rising_edge(salvar)) then
		PC <= entrada;
	end if;
	end process;
end architecture;
