----------------------------------------------------------------------------------
-- Company: UMB 
-- Engineer: Zachary Garnes
-- 
-- Create Date: 03/16/2021 03:12:05 PM
-- Design Name: 
-- Module Name: MUX11to1 - Behavioral
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

entity MUX8to1 is
    generic (N : positive := 4);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           C : in STD_LOGIC_VECTOR (N-1 downto 0);
           D : in STD_LOGIC_VECTOR (N-1 downto 0);
           E : in STD_LOGIC_VECTOR (N-1 downto 0);
           F : in STD_LOGIC_VECTOR (N-1 downto 0);
           G : in STD_LOGIC_VECTOR (N-1 downto 0);
           H : in STD_LOGIC_VECTOR (N-1 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (N-1 downto 0));
end MUX8to1;

architecture dataflow of MUX8to1 is

begin
 with SEL select Z <=
        A when "0000",
        B when "0001",
        C when "0010",
        D when "0011",
        E when "0100",
        F when "0101",
        G when "0110",
        H when "0111",
        (others => 'U') when others;
end dataflow;
