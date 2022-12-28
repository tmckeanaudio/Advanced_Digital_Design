----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/01/2021 10:49:39 PM
-- Design Name: 
-- Module Name: Inst_Exec_tb - stimulus
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

entity Inst_Exec_tb is
end Inst_Exec_tb;

architecture stimulus of Inst_Exec_tb is

component Inst_Execution_Block is
    Port (  
            clk : in std_logic;
            Inst : in unsigned(15 downto 0); -- 16-bit Instruction from Instruction Memory
            Z : out unsigned(15 downto 0); -- 16- bit Output from ALU 
            JumpOffset : out unsigned (7 downto 0);
            JumpFlag : out std_logic;
            BranchFlag : out std_logic;
            FoB : out std_logic;
            PC_Address : out unsigned(7 downto 0) );
end component;

signal clk_s : std_logic := '1';
signal Inst_s, Z_s : unsigned (15 downto 0) := "0000000000000000";
signal JumpOffset_s, PC_Address_s : unsigned(7 downto 0):= "00000000";
signal JumpFlag_s, FoB_s, BranchFlag_s : std_logic := '0';


begin
    
    UUT: Inst_Execution_Block
    port map (
        clk => clk_s,
        Inst => Inst_s,
        Z => Z_s,
        JumpOffset => JumpOffset_s,
        JumpFlag => JumpFlag_s,
        BranchFlag => BranchFlag_s,
        FoB => FoB_s,
        PC_Address => PC_Address_s );
        
clk_s <= not clk_s after 5 ns;
Inst_s <= "0110000111000111" after 0ns, "0110001111001000" after 10ns, "1001000001000001" after 20ns, "0000010000001000" after 20ns, "1001010000000000" after 30ns, "0011011000001000" after 50ns, "1001011000000100" after 60 ns, "0010100000001000" after 80ns, "1001100000001000" after 90ns, "1000101000000100" after 110ns, "1000110000001000" after 130ns, "0001111101110000" after 150ns, "1001111000001100" after 160ns;
-- "0000010000001000" after 40ns;
-- "0000010000001000" after 20ns, "1001010000000000" after 30ns, "0011011000001000" after 50ns, "1001011000000100" after 60 ns, "0010100000001000" after 80ns, "1001100000001000" after 90ns, "1000101000000100" after 110ns, "1000110000001000" after 130ns, "0001111101110000" after 150ns, "1001111000001100" after 160ns; 
-- "0000010000001000" after 20ns, "1001010000000000" after 30ns, "0011011000001000" after 50ns, "1001011000000100" after 60 ns, "0010100000001000" after 80ns, "1001100000001000" after 90ns, "1000101000000100" after 110ns, "1000110000001000" after 130ns, "0001111101110000" after 150ns, "1001111000001100" after 160ns;  
-- "1011010001000000" after 20ns, "1011011000001000" after 30ns; 
-- "1100000100000010" after 20ns, 
end stimulus;
