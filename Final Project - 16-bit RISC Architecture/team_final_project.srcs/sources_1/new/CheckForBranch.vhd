----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/06/2021 05:03:39 PM
-- Design Name: 
-- Module Name: CheckForBranch - Behavioral
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

entity CheckForBranch is
  Port (
        func_bits : in std_logic_vector(3 downto 0);
        ALU_Result : in unsigned(15 downto 0);
        BranchFlag : out std_logic );
end CheckForBranch;

architecture Behavioral of CheckForBranch is

signal Branch_tmp : std_logic;

begin
    process(func_bits, ALU_Result)
        begin
        if (func_bits = "1100") AND (ALU_Result = "0000000000000000") then
            Branch_tmp <= '1';
        else
            Branch_tmp <= '0';
        end if;
    end process;       
    
    BranchFlag <= Branch_tmp;
    
end Behavioral;
