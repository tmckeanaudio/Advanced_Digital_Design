----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 06:59:49 PM
-- Design Name: 
-- Module Name: MUX2to1_1bit - Behavioral
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

entity MUX2to1_1bit is
    Port ( A, B : in unsigned(7 downto 0);
           SEL : in STD_LOGIC;
           Z : out unsigned(7 downto 0));
end MUX2to1_1bit;

architecture dataflow of MUX2to1_1bit is

begin
    with SEL select Z <=
        A when '0',
        B when '1',
        "UUUUUUUU" when others;
end dataflow;

