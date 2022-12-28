----------------------------------------------------------------------------------
-- Company: UMB
-- Engineer: Zachary Garnes
-- 
-- Create Date: 03/16/2021 02:39:59 PM
-- Design Name: 
-- Module Name: Half_Subtractor - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Half_Subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Difference : out STD_LOGIC;
           Barrow : out STD_LOGIC);
end Half_Subtractor;

architecture dataflow of Half_Subtractor is

begin
    Difference <= A XOR B;
    Barrow <= (NOT A) AND B;
end dataflow;
