----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 05:24:07 PM
-- Design Name: 
-- Module Name: n_bit_ripple_carry_sub - n_bit_ripple_carry_sub_tb
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

entity n_bit_ripple_carry_sub_tb is
end n_bit_ripple_carry_sub_tb;

architecture n_bit_ripple_carry_sub_tb_stimulus of n_bit_ripple_carry_sub_tb is

component n_bit_ripple_carry_subtractor is 
    generic(N : integer := 2);
    Port ( a, b : in STD_LOGIC_VECTOR (N-1 downto 0);        
           bor_in : in STD_LOGIC;
           diff : out STD_LOGIC_VECTOR (N-1 downto 0);
           bor_out : out STD_LOGIC);
               
end component;
-- Stimulus signals initialized to '0'
constant N: integer := 2; 
signal a_s, b_s, diff_s: std_logic_vector (N-1 downto 0) := "00"; 
signal bin_s, bout_s : STD_LOGIC := '0';

begin
-- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: n_bit_ripple_carry_subtractor 
    generic map (N => 2)
    port map (
        a(0) => a_s(0),
        a(1) => a_s(1),
        b(0) => b_s(0),
        b(1) => b_s(1),
        bor_in => bin_s,
        diff(0) => diff_s(0),
        diff(1) => diff_s(1),
        bor_out => bout_s );
        
    a_s(1) <= not a_s(1) after 160ns;
    a_s(0) <= not a_s(0) after 40ns;
    b_s(1) <= not b_s(1) after 80ns;
    b_s(0) <= not b_s(0) after 20ns;
    bin_s <= '0';
        
end n_bit_ripple_carry_sub_tb_stimulus;