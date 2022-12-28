----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2021 09:42:53 PM
-- Design Name: 
-- Module Name: Mult_tb - stimulus
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

entity Mult_tb is
end Mult_tb;

architecture mult_stimulus of Mult_tb is

component N_bit_multiplier
    port(
        A, B : in std_logic_vector(3 downto 0);
        P : out std_logic_vector(7 downto 0));
end component;

signal A_s, B_s : std_logic_vector (3 downto 0) := "0000";
signal P_s : std_logic_vector(7 downto 0);

begin
-- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: N_bit_multiplier
    port map(
    A => A_s,
    B => B_s,
    P => P_s );

    A_s <= "0110" after 0ns,"0110" after 10ns,"1110" after 20ns,"0011" after 30ns,"1100" after 40ns,"1111" after 50ns;
    B_s <= "0010" after 0ns,"0110" after 10ns,"0010" after 20ns,"0011" after 30ns,"0100" after 40ns,"1111" after 50ns;

end mult_stimulus;
