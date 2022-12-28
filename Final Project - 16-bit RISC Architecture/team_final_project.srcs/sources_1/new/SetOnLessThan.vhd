----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2021 05:02:53 PM
-- Design Name: 
-- Module Name: SetOnLessThan - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SetOnLessThan is
  Port (
        func : in std_logic_vector(3 downto 0);
        Borrow : in std_logic;
        DataOut : out unsigned(15 downto 0) 
         );
end SetOnLessThan;

architecture Behavioral of SetOnLessThan is

begin
    process(Borrow)
    begin
    if func = "1011" then -- if SET ON LESS THAN
        if Borrow = '0' then
            DataOut <= "0000000000000000";
        elsif Borrow = '1' then
            DataOut <= "0000000000000001";
        end if;
    end if;
end process;

end Behavioral;
