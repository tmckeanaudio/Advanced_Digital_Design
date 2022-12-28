library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Data_memory is
port(
clk, rst : in std_logic;
WE : in std_logic; -- Write Enable
A: in unsigned(7 downto 0); -- Address
DI: in unsigned (15 downto 0); -- Data In
DO: out unsigned(15 downto 0) -- Data Out
);
end Data_memory;

architecture my_RAM of Data_memory is

type RAMtype is array(0 to 255) of unsigned (7 downto 0); -- 256 Memory locations due to 8-bit address

signal DM : RAMtype;

begin

process (rst,clk) is
begin

if (rst = '1') then

	DM <= (others => (others => '0')); -- reset all bits to 0

elsif (clk ='1' and clk'event) then
	
	DO <= DM(to_integer(A)) & DM(to_integer(A+1)); -- read from RAM address and place on output

	if (WE = '1') then

		DM(to_integer(A)) <= DI(15 downto 8); -- write to RAM address the data in the input
		DM(to_integer(A+1)) <= DI(7 downto 0);
	
	end if;

end if;

end process;

end my_RAM;

