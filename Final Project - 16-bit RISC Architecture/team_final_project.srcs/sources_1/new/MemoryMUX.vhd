----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/29/2021 09:21:57 PM
-- Design Name: 
-- Module Name: MemoryMUX - Behavioral
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

entity MemoryMUX is
    Port ( 
            func : in STD_LOGIC_VECTOR(3 downto 0); -- func select bits from instruction
            Mem : in unsigned(15 downto 0); -- Memory stored values
            A : in unsigned(15 downto 0); -- ALU result
            Z : out unsigned(15 downto 0)); -- Output of MUX to Write back to Register Memory
end MemoryMUX;

architecture Behavioral of MemoryMUX is

begin

    Z <= Mem when func = "1000" else A; 


end Behavioral;
