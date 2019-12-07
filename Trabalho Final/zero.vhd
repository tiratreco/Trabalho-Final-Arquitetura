
library ieee;
use ieee.std_logic_1164.all;

entity zero is
port(
	A	: in std_logic_vector (15 downto 0);
	z	: out std_logic);
end zero;

architecture comportamento of zero is
signal ou1, ou2, ou3, ou4 : std_logic; --sinal intermediario para organizar o codigo
begin
	ou1 <= (A(0) OR A(1) OR A(2) OR A(3));
	ou2 <= (A(4) OR A(5) OR A(6) OR A(7));
	ou3 <= (A(8) OR A(9) OR A(10) OR A(11));
	ou4 <= (A(12) OR A(13) OR A(14) OR A(15));
	z <= NOT (ou1 OR ou2 OR ou3 OR ou4);
end comportamento;