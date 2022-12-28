----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/07/2021 10:02:37 PM
-- Design Name: 
-- Module Name: Cathode_Block - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity Cathode_Block is
    Port ( 
        clk : in std_logic;
        cat_mux : out std_logic;
        cat_out : out std_logic );
end Cathode_Block;

architecture Behavioral of Cathode_Block is

begin
    
    cat_mux <= clk AND '1';
    cat_out <= clk AND '1';

end Behavioral;
