----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/03/2021 02:03:40 PM
-- Design Name: 
-- Module Name: half_adder2 - Behavioral
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

entity half_adder2 is
    Port ( A2 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           Sum2 : out STD_LOGIC;
           Carry2 : out STD_LOGIC);
end half_adder2;

architecture Behavioral of half_adder2 is

begin
Sum2 <= A2 XOR B2;
Carry2 <= A2 AND B2;

end Behavioral;
