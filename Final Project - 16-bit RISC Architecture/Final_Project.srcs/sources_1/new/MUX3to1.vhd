----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:07:59 PM
-- Design Name: 
-- Module Name: MUX3to1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX3to1 is
    Port ( Default_PC : in STD_LOGIC_VECTOR(7 downto 0);
           Jump : in STD_LOGIC_VECTOR(7 downto 0);
           Branch : in STD_LOGIC_VECTOR(7 downto 0);
           SEL : in STD_LOGIC_VECTOR(1 downto 0);
           PC_out : out STD_LOGIC_VECTOR(7 downto 0));
end MUX3to1;

architecture Behavioral of MUX3to1 is

begin
    with SEL select PC_out <=
        Default_PC when "00",
        Branch when "01",
        Jump when "10",
        "UUUUUUUU" when others;
end Behavioral;
