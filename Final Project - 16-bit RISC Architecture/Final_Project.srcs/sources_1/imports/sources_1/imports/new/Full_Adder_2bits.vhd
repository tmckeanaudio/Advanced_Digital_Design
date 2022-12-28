----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Zachary Garnes
-- 
-- Create Date: 02/16/2021 05:24:39 PM
-- Design Name: 
-- Module Name: Full_Adder_2bits - Structural
-- Project Name: Lab1
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_2bits is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Carry_In : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (1 downto 0);
           Carry_Out : out STD_LOGIC);
end Full_Adder_2bits;

architecture Structural of Full_Adder_2bits is

component Full_Adder is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Carry_In : in STD_LOGIC;
        Sum : out STD_LOGIC;
        Carry_Out : out STD_LOGIC
        );
end component;

signal cin_fa1 : STD_LOGIC;

begin
fa0: Full_Adder port map ( 
    A => A(0),
    B => B(0),
    Carry_in => Carry_in, 
    Sum => sum(0),
    Carry_out => cin_fa1);

fa1: Full_Adder port map ( 
    A => A(1),
    B => B(1),
    Carry_in => cin_fa1, 
    Sum => sum(1),
    Carry_out => Carry_Out);
    
end Structural;
