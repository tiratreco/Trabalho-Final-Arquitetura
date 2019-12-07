library ieee;
use ieee.std_logic_1164.all;

entity deslocador is
port(
	A	: in std_logic_vector (15 downto 0); --numero a ser deslocado
	des	: in std_logic; --deslocar? 0=nao 1=sim
	dir	: in std_logic; --direcao do deslocamento: 0=esquerda 1=direita
	C	: out std_logic_vector (15 downto 0)); --saida, deslocada ou nao
end deslocador;

architecture comportamento of deslocador is

signal
dd   : std_logic_vector (1 downto 0);

BEGIN
dd(1) <= des;
dd(0) <= dir;

process (dd, A)
begin
	if (dd="10") then --mover p/ esquerda
		C(0) <= '0';
		C(1) <= A(0);
		C(2) <= A(1);
		C(3) <= A(2);
		C(4) <= A(3);
		C(5) <= A(4);
		C(6) <= A(5);
		C(7) <= A(6);
		C(8) <= A(7);
		C(9) <= A(8);
		C(10) <= A(9);
		C(11) <= A(10);
		C(12) <= A(11);
		C(13) <= A(12);
		C(14) <= A(13);
		C(15) <= A(14);
	elsif (dd="11") then --mover p/ direita
		C(15) <= '0';
		C(14) <= A(15);
		C(13) <= A(14);
		C(12) <= A(13);
		C(11) <= A(12);
		C(10) <= A(11);
		C(9) <= A(10);
		C(8) <= A(9);
		C(7) <= A(8);
		C(6) <= A(7);
		C(5) <= A(6);
		C(4) <= A(5);
		C(3) <= A(4);
		C(2) <= A(3);
		C(1) <= A(2);
		C(0) <= A(1);
	else --resto(nao mover)
		C <= A;
	end if;
end process;
end architecture;
