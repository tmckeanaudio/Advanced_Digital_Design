----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/13/2021 10:49:38 PM
-- Design Name: 
-- Module Name: Lab2_Design - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Design of the entire Lab 2 including ALU and 7-Segment Driver.
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

entity Lab2_Design is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Seg_Output : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow_Out : out STD_LOGIC);
end Lab2_Design;

architecture Structural of Lab2_Design is

component Arithmetic_Logic_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           R : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC);
end component;

component Seven_Segment_Driver is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Seven_Seg_In : STD_LOGIC_VECTOR (3 downto 0);

begin

ALU: Arithmetic_Logic_Unit port map (
    A => A,
    B => B,
    Function_Select => Function_Select,
    R => Seven_Seg_In,
    Overflow => Overflow_Out);
    
LED: Seven_Segment_Driver port map (
    Input => Seven_Seg_In,
    Output => Seg_Output);

end Structural;
