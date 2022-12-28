----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 08:48:46 PM
-- Design Name: 
-- Module Name: ALU_STORE_MUX - Behavioral
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

entity ALU_STORE_MUX is
  Port (
        func : in std_logic_vector(3 downto 0);
        MemReg : in unsigned(15 downto 0);
        ALU_Out : in unsigned(15 downto 0);
        SetLessThan : in unsigned(15 downto 0);
        DataOut : out unsigned(15 downto 0));
end ALU_STORE_MUX;

architecture Behavioral of ALU_STORE_MUX is

begin

with func select DataOut <= 
    ALU_Out when "0000", -- ADD
    ALU_Out when "0001", -- SUBTRACT
    ALU_Out when "0010", -- AND
    ALU_Out when "0011", -- OR
    ALU_Out when "0100", -- SHIFT LEFT
    ALU_Out when "0101", -- SHIFT RIGHT
    ALU_Out when "0110", -- ADDI
    ALU_Out when "0111", -- ANDI 
    MemReg when "1001", -- STORE
    SetLessThan when "1011", -- SET ON LESS THAN
    ALU_Out when "1100", -- BRANCH ON EQUAL
    "----------------" when others;

end Behavioral;
