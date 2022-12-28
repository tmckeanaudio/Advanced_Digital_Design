----------------------------------------------------------------------------------
-- Company: UMass Boston 
-- Engineer: Zachary Garnes
-- 
-- Create Date: 04/06/2021 08:36:44 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
-- Project Name: Lab 3 - Sequential BCD Counter
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

entity clock_divider is
    generic (N : positive := 125000000);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal temp : STD_LOGIC := '0';
signal count : natural := 1; 

begin
    process(clk_in)
    begin
        if (clk_in' event) and (clk_in = '1') then 
            if (count = N) then 
                temp <= not temp; 
                count <= 1;
            else 
                count <= count + 1;
                temp <= '0'; 
            end if; 
        end if;
        clk_out <= temp;     
     end process;            
end Behavioral;
