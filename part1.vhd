library ieee;
use  ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part1 is
	port(
		a,b : in unsigned(3 downto 0);
		cin : in unsigned(0 downto 0);
		s: out unsigned (3 downto 0);
		cd : out std_logic
	);
end part1;

architecture arch of part1 is
	signal o : unsigned(4 downto 0);
	signal result : unsigned (4 downto 0);
	begin
	process (a,b,cin)
		begin
		o <= ('0'& a)+b+cin;
		if (o>"1001") then result <= o + "110";
		elsif (o<="1001")then result <= o;
		end if;
	end process;
	cd <= result(4);
	s <= result (3 downto 0);
end arch;
