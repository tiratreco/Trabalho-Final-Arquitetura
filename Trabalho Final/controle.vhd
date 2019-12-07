library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity controle is
port(
CLK	 : in std_logic;
ligar 	 : in std_logic;
codop	 : in std_logic_vector(3 downto 0);
r1	 : in std_logic_vector(3 downto 0);
z, n     : in std_logic;
control	 : out std_logic_vector(9 downto 0);
endSal	 : out std_logic_vector(3 downto 0);
sel1     : out std_logic;
proxPC	 : out std_logic);
end controle;

architecture comportamento of controle is
signal contador : integer range 0 to 5;

begin
	process (CLK)
	begin
	--0 == tipo R
	--1 == tipo I ou J

	if(rising_edge(ligar))then
		contador <= 0;
	end if;

	if (codop = "0100") then
	endSal <= r1;
	elsif (codop = "1100") then
	endSal <= "0010";
	else
	endSal <= "0000";
	end if;

	if (contador = 0) then
	control <= "0000000000";
	sel1 <= '1';
	proxPC <= '1';
	else 
	
	proxPC <= '0';
	if (codop = "0000") then--operacao nula(pula a instrucao)
		if (contador = 1) then
		control <= "0000000000";
		end if;
		if (contador = 2) then
		control <= "0000000000";
		end if;
		if (contador = 3) then
		control <= "0000000000";
		end if;
	end if;
	if (codop = "0001") then--add
		if (contador = 1) then
		control <= "1000000000";
		end if;
		if (contador = 2) then
		control <= "1100000000";
		end if;
		if (contador = 3) then
		control <= "0000000000";
		end if;
	end if;
	if (codop = "0010") then--sub
	end if;
	if (codop = "0011") then--and
	end if;
	if (codop = "0100") then--move
		if (contador = 1) then
		control <= "1000001000";
		end if;
		if (contador = 2) then
		control <= "1100001000";
		end if;
		if (contador = 3) then
		control <= "0000000000";
		end if;
	end if;
	if (codop = "0101") then--sll
	end if;
	if (codop = "1000") then--lw
		if (contador = 1) then
		control <= "1001010000";
		end if;
		if (contador = 2) then
		control <= "1101010000";
		end if;
		if (contador = 3) then
		control <= "1101010000";
		end if;
	end if;
	if (codop = "1001") then--sw
		if (contador = 1) then
		control <= "1001000000";
		end if;
		if (contador = 2) then
		control <= "1011000000";
		end if;
		if (contador = 3) then
		control <= "0000000000";
		end if;
	end if;
	if (codop = "1010") then--beq
	end if;
	if (codop = "1011") then--jr
	end if;
	if (codop = "1100") then--jal
	end if;
	if (codop = "1101") then--jump
	end if;
	end if;

	contador <= contador + 1;
	if (contador = 3) then
	contador <= 0;
	end if;

	end process;
end architecture;