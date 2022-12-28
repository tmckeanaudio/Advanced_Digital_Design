----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: half_sub - dataflow
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: modular design of a half subtractor circuit for implementation into a full adder design
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

entity half_sub1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           diff : out STD_LOGIC;
           borrow : out STD_LOGIC);
end half_sub1;

architecture dataflow of half_sub1 is

begin
    diff <= a XOR b;
    borrow <= not a AND b;

end dataflow;
