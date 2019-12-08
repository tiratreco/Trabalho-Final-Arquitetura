library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity programa is
port(
start    : in std_logic;
ende	 : in std_logic_vector(15 downto 0);
saida    : out std_logic_vector (15 downto 0));
end programa;

architecture comportamento of programa is
signal endereco : integer range 0 to 65535;
type memo is array (integer range 0 to 65535) of std_logic_vector(15 downto 0);
signal memoria : memo;

begin
	endereco <= CONV_INTEGER(ende);
	saida <= memoria(endereco);
	process (start)
	begin
 	--registradores:
	--0 -> $AC
	--1 -> $ZERO
	--2 -> $SP
	--3 -> $RA
	
	--4 -> $S1
	--5 -> $S2
	--6 -> $S3
	--7 -> $S4
	--8 -> $T1
	--9 -> $T2
	--10 -> $T3
	--11 -> $S4
	--12 -> $A1
	--13 -> $A2
	--14 -> $V1
	--15 -> $V2
	if(start = '1') then
		--PROGRAMA
		memoria(0) <= "1000000100000001";--lw 1($zero)
		memoria(1) <= "0100000001010000";--move $S2 $AC (S2 RECEBE AC)
		memoria(2) <= "1000000100000000";--lw 0($zero)
		memoria(3) <= "0100000001000000";--move $S1 $AC (S1 RECEBE AC)

		memoria(4) <= "1000000100000010";--lw 2($zero)
		memoria(5) <= "0100000001100000";--move $S3 $AC (S1 RECEBE AC)
		memoria(6) <= "0001010001010000";--add $S1 $S2
		memoria(7) <= "1010011011111010";--beq $S3 -6
	end if;
	end process;
end architecture;