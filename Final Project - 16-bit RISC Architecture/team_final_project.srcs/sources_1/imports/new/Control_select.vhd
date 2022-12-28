----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:17:17 PM
-- Design Name: 
-- Module Name: Control_select - Behavioral
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

entity Control_select is
    Port ( Jump : in STD_LOGIC;
           Branch : in STD_LOGIC;
           SEL : out STD_LOGIC_VECTOR(1 downto 0));
end Control_select;

architecture Behavioral of Control_select is

begin

SEL <= Jump & Branch; 

end Behavioral;
