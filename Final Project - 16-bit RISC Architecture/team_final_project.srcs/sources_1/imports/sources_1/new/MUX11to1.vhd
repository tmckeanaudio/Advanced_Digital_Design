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
use IEEE.NUMERIC_STD.ALL;

entity MUX10to1 is
    Port ( A : in unsigned (15 downto 0);
           B : in unsigned (15 downto 0);
           C : in unsigned (15 downto 0);
           D : in unsigned (15 downto 0);
           E : in unsigned (15 downto 0);
           F : in unsigned (15 downto 0);
           G : in unsigned (15 downto 0);
           H : in unsigned (15 downto 0);
           I : in unsigned (15 downto 0);
           J : in unsigned (15 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out unsigned (15 downto 0));
end MUX10to1;

architecture dataflow of MUX10to1 is

begin
 with SEL select Z <=
        A when "0000", -- ADD
        B when "0001", -- SUBTRACT
        C when "0010", -- AND
        D when "0011", -- OR
        E when "0100", -- SHIFT LEFT
        F when "0101", -- SHIFT RIGHT
        G when "0110", -- ADDI
        H when "0111", -- ANDI 
        I when "1011", -- SET ON LESS THAN
        J when "1100", -- BRANCH ON EQUAL
        "----------------" when others;
end dataflow;
