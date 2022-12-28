----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 08:48:04 PM
-- Design Name: 
-- Module Name: MUX3to1_2bit - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX3to1_2bit is
    Port ( Default_PC : in unsigned(7 downto 0);
           Jump : in unsigned(7 downto 0);
           Branch : in unsigned(7 downto 0);
           SEL : in STD_LOGIC_VECTOR(1 downto 0);
           PC_out : out unsigned(7 downto 0));
end MUX3to1_2bit;

architecture Behavioral of MUX3to1_2bit is

begin
    with SEL select PC_out <=
        Default_PC when "00",
        Branch when "01",
        Jump when "10",
        "UUUUUUUU" when others;
end Behavioral;
