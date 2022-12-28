----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2021 10:28:04 AM
-- Design Name: 
-- Module Name: Overflow_MUX - Dataflow
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

entity Overflow_MUX is
        generic (N: positive:= 4);
        Port( 
        Cout, Bout: in std_logic; 
        Function_Select: in std_logic_vector (N-1 downto 0);
        Overflow_out: out std_logic );
        
end Overflow_MUX;

architecture Dataflow of Overflow_MUX is

begin
    with Function_Select select Overflow_out <=
    Cout when "0000",
    Bout when "0001",
    '-' when others;
    
end Dataflow;
