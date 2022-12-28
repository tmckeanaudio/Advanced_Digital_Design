----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/29/2021 09:13:52 PM
-- Design Name: 
-- Module Name: Sign_Extend - Behavioral
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

entity Sign_Extend is
    Port ( A : in unsigned(5 downto 0);
           Z : out unsigned(15 downto 0));
end Sign_Extend;

architecture Behavioral of Sign_Extend is

begin

    Z <= unsigned(resize(signed(A), Z'length)); -- Extends 6-bit immediate value to unsigned 16-bit

end Behavioral;
