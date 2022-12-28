----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/13/2021 09:32:54 PM
-- Design Name: 
-- Module Name: tc_tb - tc_tv_stimulus
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench simulation of Twos Complement source
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

entity tc_tb is
end tc_tb;

architecture tc_tv_stimulus of tc_tb is

component Twos_Complement is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (3 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (3 downto 0));          
end component;

-- Stimulus signals initialized to '0'

signal diff_s : std_logic_vector (3 downto 0) := "0000";
signal tcout_s : std_logic_vector (3 downto 0) := "0000";

begin
-- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: Twos_Complement
    port map ( 
    Diff_Input(0) => diff_s(0),
    Diff_Input(1) => diff_s(1),
    Diff_Input(2) => diff_s(2),
    Diff_Input(3) => diff_s(3),
    Twos_Comp_Out(0) => tcout_s(0),
    Twos_Comp_Out(1) => tcout_s(1),
    Twos_Comp_Out(2) => tcout_s(2),
    Twos_Comp_Out(3) => tcout_s(3) );
    
    diff_s(0) <= not diff_s(0) after 10ns;
    diff_s(1) <= not diff_s(1) after 20ns;
    diff_s(2) <= not diff_s(2) after 40ns;
    diff_s(3) <= not diff_s(3) after 80ns; 
   
end tc_tv_stimulus;
