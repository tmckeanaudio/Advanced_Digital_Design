----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/06/2021 08:47:19 PM
-- Design Name: 
-- Module Name: clk_divider - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_divider is
    generic (N: positive:= 62500000);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
shared variable count: natural := 0;
signal tmp : std_logic := '0';
begin
    process(clk_in)
    begin
        if(clk_in'EVENT) AND (clk_in = '1') then
            count := count+1;              
            if (count = N) then
             tmp <= not tmp;
             count := 0; 
             else
             tmp <= '0';
             end if;               
            end if;
        clk_out <= tmp;
        end process;

end Behavioral;
