----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/03/2021 01:11:16 PM
-- Design Name: 
-- Module Name: half_adder - Behavioral
-- Project Name: ENGIN 341: Lab 0
-- Target Devices: 
-- Tool Versions: 
-- Description: Project uses two user defined half adders that utilize both switches and pushbuttons to trigger LEDs on the Zybo Board
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

entity half_adder is
    Port ( A, A2 : in STD_LOGIC;
           B, B2 : in STD_LOGIC;
           Sum, Sum2 : out STD_LOGIC;
           Carry, Carry2 : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin
Sum <= A XOR B;
Carry <= A AND B;
Sum2 <= A2 XOR B2;
Carry2 <= A2 AND B2;
end Behavioral;
