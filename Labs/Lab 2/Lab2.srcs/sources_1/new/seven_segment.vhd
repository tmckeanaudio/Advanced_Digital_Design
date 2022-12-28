----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2021 10:47:52 PM
-- Design Name: 
-- Module Name: seven_segment - Behavioral
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

entity Seven_Segment_Driver is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0));
end Seven_Segment_Driver;

architecture Dataflow of Seven_Segment_Driver is

begin

with Input select
Output <=
    "0111111" when "0000",
    "0000110" when "0001",
    "1011011" when "0010",
    "1001111" when "0011",
    "1100110" when "0100",
    "1101101" when "0101",
    "1111101" when "0110",
    "0000111" when "0111",
    "1111111" when "1000",
    "1100111" when "1001",
    "1110111" when "1010",
    "1111100" when "1011",
    "0111001" when "1100",
    "1011110" when "1101",
    "1111001" when "1110",
    "1110001" when "1111",
    "0000000" when others;

end Dataflow;
