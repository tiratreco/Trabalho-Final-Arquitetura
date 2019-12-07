library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ULA is 
port(
A	: in std_logic_vector (15 downto 0);
B	: in std_logic_vector (15 downto 0);
op	: in std_logic_vector (1 downto 0); --indica operacao a ser feita
C	: buffer std_logic_vector (15 downto 0);
z	: out std_logic; -- sinal de saida indica se o resultado ? zero
n 	: out std_logic); -- sinal de saida indica se o resultado ? negativo
end ULA;

architecture comportamento of ULA is

component negativo is
port (
A	: in std_logic_vector (15 downto 0);
n	: out std_logic);
end component negativo;

component zero is
port(
	A	: in std_logic_vector (15 downto 0);
	z	: out std_logic);
end component zero;

begin
process (op, A, B)
begin
if    (op = "00") then --soma
	C <= A + B;
elsif (op = "01") then -- E
	C <= A AND B;
elsif (op = "10") then -- A
	C <= A;
else		     -- nao A
	C <= not A;
end if;
end process;

neg : negativo port map (C, n);
zer : zero port map (C, z);

end architecture;
