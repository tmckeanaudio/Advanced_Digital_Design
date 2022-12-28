----------------------------------------------------------------------------------
-- Company: UMass Boston 
-- Engineer: Zachary Garnes
-- Create Date: 02/16/2021 05:24:38 PM
-- Design Name: 
-- Module Name: Full_Adder - Mixed
-- Project Name: Lab 2 - ALU Design 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Carry_In : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry_Out : out STD_LOGIC);
end Full_Adder;

architecture Mixed of Full_Adder is

component Half_Adder is 
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC; 
        Sum : out STD_LOGIC; 
        Carry : out STD_LOGIC 
        );
end component;

signal s1, c1, c2 : STD_LOGIC; 

begin
    ha1: Half_Adder port map (
        A => A,
        B => B, 
        Sum => s1,
        Carry => c1); 
    ha2: Half_Adder port map (
        A => Carry_in,
        B => s1, 
        Sum => Sum,
        Carry => c2);  
    or_gate: Carry_out <= c1 or c2; 
end Mixed;
