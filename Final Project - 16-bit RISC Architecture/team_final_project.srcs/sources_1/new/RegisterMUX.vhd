----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/29/2021 09:38:03 PM
-- Design Name: 
-- Module Name: RegisterMUX - Behavioral
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

entity RegisterMUX is
    Port ( 
            func : in STD_LOGIC_VECTOR(3 downto 0);
            SRD2 : in unsigned(15 downto 0);
            Immediate : in unsigned (15 downto 0);
            Z : out unsigned(15 downto 0));
end RegisterMUX;

architecture Behavioral of RegisterMUX is

begin
    with func select Z <=
        SRD2 when "0000", -- SRD2 when ADD Operation performed
        SRD2 when "0001", -- SRD2 when SUBTRACT Operation performed
        SRD2 when "0010", -- SRD2 when AND Operation Performed
        SRD2 when "0011", -- SRD2 when OR Operation Performed
        SRD2 when "0100", -- SRD2 when SHIFT LEFT Operation Performed
        SRD2 when "0101", -- SRD2 when SHIFT RIGHT Operation Performed
        Immediate when "0110", -- IMMEDIATE when ADDi Operation Performed
        Immediate when "0111", -- IMMEDIATE when ANDi Operation Performed
        SRD2 when "1011", -- SET ON LESS THAN
        SRD2 when "1100", -- BRANCH ON EQUAL
        "----------------" when others;
end Behavioral;
