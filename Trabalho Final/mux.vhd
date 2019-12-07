library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
A	: in std_logic_vector (15 downto 0);
B	: in std_logic_vector (15 downto 0);
s	: in std_logic;
C	: out std_logic_vector (15 downto 0));
end mux;

architecture comportamento of mux is
begin
process (s, A, B)
begin
if (s='0') then
	C <= A;
else
	C <= B;
end if;
end process;
end architecture;

