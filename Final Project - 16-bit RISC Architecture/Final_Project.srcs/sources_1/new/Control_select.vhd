----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:17:17 PM
-- Design Name: 
-- Module Name: Control_select - Behavioral
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

entity Control_select is
    Port ( Jump : in STD_LOGIC;
           Branch : in STD_LOGIC;
           SEL : out STD_LOGIC_VECTOR(1 downto 0));
end Control_select;

architecture Behavioral of Control_select is

begin

SEL <= Jump & Branch; 

end Behavioral;
