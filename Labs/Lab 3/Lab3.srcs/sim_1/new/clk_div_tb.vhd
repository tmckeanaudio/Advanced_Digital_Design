----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/06/2021 09:18:20 PM
-- Design Name: 
-- Module Name: clk_div_tb - stimulus
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

entity clk_div_tb is
end clk_div_tb;

architecture stimulus of clk_div_tb is

component clk_divider is
    port( 
        clk_in : std_logic;
        clk_out: out std_logic );
end component;

signal clkin, clkout : std_logic := '0';

begin
    UUT: clk_divider
    port map(
    clk_in => clkin,
    clk_out => clkout );
    
    clkin <= not clkin after 4ns;

end stimulus;
