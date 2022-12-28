----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/14/2021 10:28:36 AM
-- Design Name: 
-- Module Name: Output_MUX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Output Mux that takes in Overflow values from Ripple Carry Adder and Subtractor
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

entity Output_MUX is
        generic (N: integer:= 4);
        Port( 
        ADD_OP: in std_logic_vector (N-1 downto 0);
        SUB_OP: in std_logic_vector (N-1 downto 0);
        TWOS_COMP_OP: in std_logic_vector (N-1 downto 0);
        AND_OP: in std_logic_vector (N-1 downto 0);
        OR_OP: in std_logic_vector (N-1 downto 0);
        XOR_OP: in std_logic_vector (N-1 downto 0);
        NOT_OP: in std_logic_vector (N-1 downto 0);
        ShiftLeft: in std_logic_vector (N-1 downto 0);
        ShiftRight: in std_logic_vector (N-1 downto 0);
        RotateLeft: in std_logic_vector (N-1 downto 0);
        RotateRight: in std_logic_vector (N-1 downto 0);
        Function_Select: in std_logic_vector (N-1 downto 0);
        Output: out std_logic_vector (N-1 downto 0)); 
        
end Output_MUX;

architecture Dataflow of Output_MUX is

begin
    with Function_Select select 
    Output <=
    ADD_OP when "0000",
    SUB_OP when "0001",
    AND_OP when "0010",
    TWOS_COMP_OP when "0011",
    OR_OP when "0100",
    XOR_OP when "0101",
    NOT_OP when "0110",
    ShiftLeft when "0111",
    ShiftRight when "1000",
    RotateLeft when "1001",
    RotateRight when "1010",
    (others => 'U') when others;
    
end Dataflow;
