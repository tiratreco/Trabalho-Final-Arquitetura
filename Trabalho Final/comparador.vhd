library ieee;
use ieee.std_logic_1164.all;

entity comparador is
port(
A	: in std_logic_vector (15 downto 0);
B	: in std_logic_vector (15 downto 0);
saida	: out std_logic);
end comparador;

architecture comportamento of comparador is
begin

saida <= (not(A(0) xor B(0)))and (not(A(1) xor B(1)))and (not(A(2) xor B(2)))and (not(A(3) xor B(3)))and (not(A(4) xor B(4)))and (not(A(5) xor B(5)))and (not(A(6) xor B(6)))and (not(A(7) xor B(7)))and (not(A(8) xor B(8)))and (not(A(9) xor B(9)))and (not(A(10) xor B(10)))and (not(A(11) xor B(11)))and (not(A(12) xor B(12)))and (not(A(13) xor B(13)))and (not(A(14) xor B(14)))and (not(A(15) xor B(15)));
end architecture;
