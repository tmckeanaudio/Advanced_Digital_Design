----------------------------------------------------------------------------------
-- Company: UMB 
-- Engineer: Zachary Garnes
-- 
-- Create Date: 03/16/2021 03:01:12 PM
-- Design Name: 
-- Module Name: MUX2to1 - Behavioral
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

entity MUX2to1 is
    Port ( A, B : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC);
end MUX2to1;

architecture dataflow of MUX2to1 is

begin
    with SEL select Z <=
        A when "0000",
        B when "0001",
        B when "0011",
        'U' when others;
end dataflow;
