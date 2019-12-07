library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
port(
A	: in std_logic_vector (15 downto 0);
B	: in std_logic_vector (15 downto 0);
C	: in std_logic_vector (15 downto 0);
D	: in std_logic_vector (15 downto 0);
s	: in std_logic_vector (1 downto 0);
saida	: out std_logic_vector (15 downto 0));
end mux2;

architecture comportamento of mux2 is
begin
process (s, A, B, C, D)
begin
if (s="00") then
	saida <= A;
elsif (s="01") then
	saida <= B;
elsif (s="10") then
	saida <= C;
else
	saida <= D;
end if;	
end process;
end architecture;

