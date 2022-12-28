library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Register_memory is
port(
clk, rst : in std_logic;
WE : in std_logic; -- Write Enable
A: in unsigned(3 downto 0); -- Address
DI: in unsigned (15 downto 0); -- Data In
DO: out unsigned(15 downto 0) -- Data Out
);
end Register_memory;

architecture my_RAM of Register_memory is

type RAMtype is array(0 to 7) of unsigned (15 downto 0); -- 8 Register locations 

signal DM : RAMtype;

begin

process (rst,clk) is
begin

if (rst = '1') then

	DM <= (others => (others => '0')); -- reset all bits to 0

elsif (clk ='1' and clk'event) then
	
	DO <= DM(to_integer(A)); -- read from RAM address and place on output

	if (WE = '1') then

		DM(to_integer(A)) <= DI; -- write to RAM address the data in the input
	
	end if;

end if;

end process;

end my_RAM;

