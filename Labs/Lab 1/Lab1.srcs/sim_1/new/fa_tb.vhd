----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: full_adder - mixed
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

entity fa_tb is
end fa_tb;

architecture fa_tb_stimulus of fa_tb is

component full_adder is 
    port( 
        a : in STD_LOGIC; 
        b : in STD_LOGIC;
        carry_in : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry_out : out STD_LOGIC
        );
end component;
-- Stimulus signals initialized to '0'
signal a_s, b_s, cin_s, sum_s, cout_s : STD_LOGIC := '0';

begin
-- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: full_adder port map (
        a => a_s, 
        b => b_s, 
        carry_in => cin_s,
        sum => sum_s,
        carry_out => cout_s );
        
    a_s <= not a_s after 40ns;
    b_s <= not b_s after 20ns;
    cin_s <= not cin_s after 10ns;
    
end fa_tb_stimulus;
        