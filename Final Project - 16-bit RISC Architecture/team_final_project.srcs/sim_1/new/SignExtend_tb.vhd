----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/01/2021 01:57:40 PM
-- Design Name: 
-- Module Name: SignExtend_tb - Behavioral
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

entity SignExtend_tb is
end SignExtend_tb;

architecture Behavioral of SignExtend_tb is

component Sign_Extend is
    Port ( A : in STD_LOGIC_VECTOR(5 downto 0);
           Z : out unsigned(15 downto 0));
end component;

signal A_s : STD_LOGIC_VECTOR(5 downto 0) := "000000";
signal Z_s : unsigned(15 downto 0):= "0000000000000000";

begin

    UUT: Sign_Extend
    port map(
            A => A_s,
            Z => Z_s );
            
    A_s <= "000111" after 10ns, "101010" after 20ns, "111111" after 30ns;

end Behavioral;
