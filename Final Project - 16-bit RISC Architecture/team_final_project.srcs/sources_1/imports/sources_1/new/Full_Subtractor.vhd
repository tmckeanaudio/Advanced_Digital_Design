----------------------------------------------------------------------------------
-- Company: UMB
-- Engineer: Zachary Garnes 
-- 
-- Create Date: 03/16/2021 02:44:34 PM
-- Design Name: 
-- Module Name: Full_Subtractor - Mixed
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

entity Full_Subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Barrow_in : in STD_LOGIC;
           Difference : out STD_LOGIC;
           Barrow_out : out STD_LOGIC);
end Full_Subtractor;

architecture Mixed of Full_Subtractor is

component Half_Subtractor is 
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC; 
        Difference : out STD_LOGIC; 
        Barrow : out STD_LOGIC 
        );
end component;

signal d1, b1, b2 : STD_LOGIC; 

begin
    hs1: Half_Subtractor port map (
        A => A,
        B => B, 
        Difference => d1,
        Barrow => b1); 
    hs2: Half_Subtractor port map (
        A => d1,
        B => Barrow_in, 
        Difference => Difference,
        Barrow => b2);  
    or_gate: Barrow_out <= b1 or b2;
end Mixed;
