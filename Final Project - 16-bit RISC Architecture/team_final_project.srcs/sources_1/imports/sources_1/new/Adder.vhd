----------------------------------------------------------------------------------
-- Company: UMB 
-- Engineer: Zachary Garnes 
-- 
-- Create Date: 03/16/2021 02:17:29 PM
-- Design Name: 
-- Module Name: Adder - Behavioral
-- Project Name: Lab 2
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

entity Adder is
    generic (N : positive := 16);
    Port ( A, B : in unsigned (N-1 downto 0);
           Cin : in STD_LOGIC;
           S : out unsigned (N-1 downto 0);
           Cout : out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is

component Full_Adder is 
    port( 
        A : in STD_LOGIC; 
        B : in STD_LOGIC;
        Carry_In : in STD_LOGIC;
        Sum : out STD_LOGIC; 
        Carry_Out : out STD_LOGIC);
end component;

signal Cc : std_logic_vector(N downto 0);

begin
    Cc(0) <= Cin; 
    Full_Adders: for i in 0 to N-1 generate 
                    FAx: Full_Adder port map (A(i), B(i), Cc(i), S(i), Cc(i+1));
                end generate; 
     Cout <= Cc(N);
end Behavioral;

