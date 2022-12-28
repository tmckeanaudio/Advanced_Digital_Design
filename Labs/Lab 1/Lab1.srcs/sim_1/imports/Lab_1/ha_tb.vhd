----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: MR
-- 
-- Create Date: 09/17/2019 09:59:29 PM
-- Design Name: 
-- Module Name: ha_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for half_adder entity
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

entity ha_tb is
end ha_tb;

architecture ha_tb_stimulus of ha_tb is

component half_adder is
    port(
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry : out STD_LOGIC
        );
end component;

-- Stimulus signals initialized to '0'
signal a_s, b_s, sum_s, carry_out_s : STD_LOGIC := '0';

begin
    -- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: half_adder port map (
        a => a_s,
        b => b_s,
        sum => sum_s,
        carry => carry_out_s);
        
    a_s <= not a_s after 10ns;
    b_s <= not b_s after 20ns;

end ha_tb_stimulus;
