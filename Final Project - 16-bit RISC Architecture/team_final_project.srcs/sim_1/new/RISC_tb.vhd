----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 08:41:35 PM
-- Design Name: 
-- Module Name: RISC_tb - stimulus
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

entity RISC_tb is
end RISC_tb;

architecture stimulus of RISC_tb is

component RISC_Architecture is
  Port (
        clk : in std_logic );
end component;
signal clk_s : std_logic := '1';

begin

    UUT: RISC_Architecture 
    port map (
    clk => clk_s );

clk_s <= not clk_s after 5 ns;

end stimulus;
