library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity ex3 is
port  (
	a,b : in unsigned(3 downto 0);
	Y : out unsigned (3 downto 0);
	NF,CF,ZF : out std_logic;
	opCode : in std_logic_vector( 3 downto 0));
end ex3;
 
architecture arch of ex3 is
signal result: unsigned(4 downto 0);
begin
process (a,b,opCode)
begin
	case opCode is --operations case
		when "0000" => result <= ("0"&a) + b;
		when "0001" => result <= ("0"&a) - b;
		when "0010" => result <= ("0"&a) + 1;
		when "0011" => result <= ("0"&a) - 1;
		when "0100" => result <= ("0"&a) + 1;
		when "0101" => result <= ("0"&a) - 1;
		when "0110" => result <= ("0"&a);
		when "0111" => result <= ("0"&b);
		when "1000" => result <= "0"&(a AND b);
		when "1001" => result <= "0"&(a OR b);
		when "1010" => result <= "0"&(a NAND b);
		when "1011" => result <= "0"&(a NOR b);
		when "1100" => result <= "0"&(a XOR b);
		when "1101" => result <= "0"&(a XNOR b);
		when "1110" => result <= "0"&(NOT a);
		when "1111" => result <= "0"&(NOT b);
	end case;

	case result(3 downto 0) is --hex to 7-seg decoder case
		when x"0" => seg7 <= "1000000";
		when x"1" => seg7 <= "1111001";
		when x"2" => seg7 <= "0100100";
		when x"3" => seg7 <= "0110000";
		when x"4" => seg7 <= "0011001";
		when x"5" => seg7 <= "0010010";
		when x"6" => seg7 <= "0000010";
		when x"7" => seg7 <= "1111000";
		when x"8" => seg7 <= "0000000";
		when x"8" => seg7 <= "0010000";
		when x"9" => seg7 <= "0000011";
		when x"A" => seg7 <= "0001000";
		when x"B" => seg7 <= "0000011";
		when x"C" => seg7 <= "1001110";
		when x"D" => seg7 <= "0100001";
		when x"E" => seg7 <= "0000110";
		when x"F" => seg7 <= "0001110";

	end case;
end process;
Y<= result(3 downto 0);
ZF<= not (result (3) or result(2) or result(1) or result(0));
NF<= result(3);
CF<= result(4);
end arch;
