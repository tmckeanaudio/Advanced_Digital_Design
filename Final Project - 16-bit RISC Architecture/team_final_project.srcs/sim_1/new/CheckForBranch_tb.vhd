----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:45:22 PM
-- Design Name: 
-- Module Name: CheckForBranch_tb - stimulus
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

entity CheckForBranch_tb is
end CheckForBranch_tb;

architecture stimulus of CheckForBranch_tb is

component CheckForBranch is
  Port (
        func_bits : in std_logic_vector(3 downto 0);
        ALU_Result : in unsigned(15 downto 0);
        BranchFlag : out std_logic );
end component;

signal func_s : std_logic_vector(3 downto 0) := "0000";
signal ALUResult_s : unsigned(15 downto 0):= "0000000000000001";
signal BranchFlag_s : std_logic := '0';

begin

    UUT: CheckForBranch
    port map (
    func_bits => func_s,
    ALU_Result => ALUResult_s,
    BranchFlag => BranchFlag_s );
    

func_s <= "1100" after 10ns;
ALUResult_s <= "0000000000000000" after 20ns;


end stimulus;
