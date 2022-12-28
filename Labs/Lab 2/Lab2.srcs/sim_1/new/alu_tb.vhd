----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/14/2021 02:36:40 PM
-- Design Name: 
-- Module Name: alu_tb - alu_tb_stimulus
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench simulation for the ALU design.
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

entity alu_tb is
end alu_tb;

architecture alu_tb_stimulus of alu_tb is

component Arithmetic_Logic_Unit is
    generic (N: positive := 4);
    Port ( 
    A,B: in std_logic_vector(N-1 downto 0);
    Function_Select: in std_logic_vector (N-1 downto 0);
    Overflow: out std_logic;
    R: out std_logic_vector(N-1 downto 0));
end component;

-- Stimulus signals initialized to '0'
signal A_s, B_s,functionSelect, output_s: std_logic_vector(3 downto 0) := "0000";
signal overflow_s: std_logic := '0'; 


begin
-- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: Arithmetic_Logic_Unit 
    port map(
       A => A_s,
       B => B_s,
       Function_Select => functionSelect,
       Overflow => overflow_s,
       R => output_s );
       
       functionSelect <= "0000" after 0ns, "0001" after 10ns, "0011" after 20ns, "0010" after 30ns, "0100" after 40ns, "0101" after 50ns,
       "0110" after 60ns, "0111" after 70ns, "1001" after 80ns, "1000" after 90ns, "1010" after 100ns, "0000" after 110ns; 
       
       A_s <= "0000", "1001" after 0ns, "1001" after 10ns, "0010" after 20ns, "0101" after 30ns, "0101" after 40ns, "0101" after 50ns,
       "1010" after 60ns, "1011" after 70ns, "1011" after 80ns, "1101" after 90ns, "1101" after 100ns, "0000" after 110ns;
    
       B_s <= "0000", "1010" after 0ns, "0010" after 10ns, "0101" after 20ns, "1101" after 30ns, "1101" after 40ns, "1101" after 50ns, "0000" after 60ns;
 
end alu_tb_stimulus;
