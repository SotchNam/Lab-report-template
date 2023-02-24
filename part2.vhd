library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity part2 is
port  (
	 a1,a0,b1,b0 : in unsigned(3 downto 0);
	 cin : in unsigned(0 downto 0);
	 s1,s0 : out unsigned(3 downto 0);
	 cd : out unsigned(0 downto 0));
end part2;
 
architecture arch of part2 is
signal seven_links : unsigned(0 downto 0);
signal result1,result0 : unsigned (4 downto 0);
signal o0,o1 : unsigned(4 downto 0); 

begin
p0 : process (a0,b0,cin)
begin
	o0 <= ('0'& a0)+b0+cin;
	if (o0>"1001") then result0 <= o0 + "110";
	elsif (o0<="1001")then result0 <= o0;
	end if;
end process;
s0 <= result0 (3 downto 0);
seven_links <= result0(4 downto 4);
p1 : process (a1,b1,seven_links)
begin
	o1 <= ('0'& a1)+b1+seven_links;
	if (o1>"1001") then result1 <= o1 + "110";
	elsif (o1<="1001")then result1 <= o1;
	end if;
end process;
cd <= result1(4 downto 4);
s1 <= result1 (3 downto 0);
end arch;
