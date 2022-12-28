----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/10/2021 11:19:30 PM
-- Design Name: 
-- Module Name: 8_bit_MULT_tb - stimulus
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

entity N_bit_MULT_tb is
end N_bit_MULT_tb;

architecture stimulus of N_bit_MULT_tb is

component N_bit_MULT is
    port(
        A, B : in std_logic_vector(7 downto 0);
        P : out std_logic_vector(15 downto 0));
end component;

signal A_s, B_s : std_logic_vector (7 downto 0) := "00000000";
signal P_s : std_logic_vector(15 downto 0);

begin
        UUT: N_bit_MULT
        port map(
        A => A_s,
        B => B_s,
        P => P_s );
        
    A_s <= "01100110" after 0ns,"01100110" after 10ns,"10001110" after 20ns,"10100011" after 30ns,"11001100" after 40ns,"00001111" after 50ns;
    B_s <= "00000010" after 0ns,"01000110" after 10ns,"00000010" after 20ns,"00000011" after 30ns,"00000100" after 40ns,"11101111" after 50ns;

end stimulus;
