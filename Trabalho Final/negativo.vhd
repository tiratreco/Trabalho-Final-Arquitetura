
library ieee;
use ieee.std_logic_1164.all;

entity negativo is
port (
A	: in std_logic_vector (15 downto 0);
n	: out std_logic);
end negativo;

architecture comportamento of negativo is
begin
	n <= A(15);
end architecture;
