----------------------------------------------------------------------------------
-- Company: UMB
-- Engineer: Zachary Garnes
-- 
-- Create Date: 03/16/2021 02:49:28 PM
-- Design Name:
-- Module Name: Subtractor - Behavioral
-- Project Name: Lab 2 - ALU Design
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

entity Subtractor is
    generic (N : positive := 16);
    Port ( A, B : in unsigned (N-1 downto 0);
           Barrow_in : in STD_LOGIC;
           Difference : out unsigned (N-1 downto 0);
           Barrow_out : out STD_LOGIC);
end Subtractor;

architecture Behavioral of Subtractor is

component Full_Subtractor is 
    port( 
        A : in STD_LOGIC; 
        B : in STD_LOGIC;
        Barrow_In : in STD_LOGIC;
        Difference : out STD_LOGIC; 
        Barrow_Out : out STD_LOGIC);
end component;

signal Cc : unsigned(N downto 0);

begin
    Cc(0) <= Barrow_in; 
    Full_Subtractors : for i in 0 to N-1 generate 
                    FAx: Full_Subtractor port map (A(i), B(i), Cc(i), Difference(i), Cc(i+1));
                end generate; 
    Barrow_out <= Cc(N);

end Behavioral;
