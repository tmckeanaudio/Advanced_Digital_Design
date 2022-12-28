----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2021 09:16:21 PM
-- Design Name: 
-- Module Name: Address_MUX - Behavioral
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
use IEEE.numeric_std.all;

entity Address_MUX is
  Port (
        AddressFlag : in std_logic;
        AddressReg : in unsigned(15 downto 0);
        Address: in unsigned(7 downto 0) );
end Address_MUX;

architecture Behavioral of Address_MUX is

begin


end Behavioral;
