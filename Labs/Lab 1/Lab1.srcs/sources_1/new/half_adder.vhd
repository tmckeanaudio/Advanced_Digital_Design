----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: half_adder - dataflow
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: modular design of a half adder circuit for implementation into a full adder design
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

entity half_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end half_adder;

architecture dataflow of half_adder is

begin
    sum <= a XOR b;
    carry <= a AND b;

end dataflow;
