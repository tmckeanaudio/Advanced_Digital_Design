----------------------------------------------------------------------------------
-- Company: Umass Boston 
-- Engineer: Zachary Garnes
-- Create Date: 02/16/2021 05:24:39 PM
-- Design Name: 
-- Module Name: Half_Adder - dataflow
-- Project Name: Lab 2 - ALU Design
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry : out STD_LOGIC);
end Half_Adder;

architecture dataflow of Half_Adder is

begin
    Sum <= A XOR B; 
    Carry <= A AND B;

end dataflow;
