library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity banco is
port(
CLK 	 : in std_logic;
reg1	 : in std_logic_vector(3 downto 0);
reg2	 : in std_logic_vector(3 downto 0);
reg3	 : in std_logic_vector(3 downto 0);
saida1	 : out std_logic_vector (15 downto 0);
saida2	 : out std_logic_vector (15 downto 0);
AC	 : out std_logic_vector (15 downto 0);
escrever : in std_logic;
entrada  : in std_logic_vector (15 downto 0));
end banco;

architecture comportamento of banco is
signal endreg1, endreg2, endreg3 : integer range 0 to 15;
type memo is array (integer range 0 to 15) of std_logic_vector(15 downto 0);
signal registradores : memo;

begin
	process (CLK)
	begin
	--1 ciclo para salvar resultado e 1 ciclo para ler
	--2 ciclos caso escreva e leia no mesmo lugar e atualizar resultado da leitura
	
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
	registradores(1) <= "0000000000000000";
	endreg1 <= CONV_INTEGER(reg1);
	endreg2 <= CONV_INTEGER(reg2);
	endreg3 <= CONV_INTEGER(reg3);
	AC <= registradores(0);
	saida1 <= registradores(endreg1);
	saida2 <= registradores(endreg2);
	
	if (escrever = '1') then
		registradores(endreg3) <= entrada;
	end if;
	end process;
end architecture;