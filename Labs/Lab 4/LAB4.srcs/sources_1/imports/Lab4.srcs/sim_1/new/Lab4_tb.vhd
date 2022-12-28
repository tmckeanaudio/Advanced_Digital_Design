----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/20/2021 11:53:30 AM
-- Design Name: 
-- Module Name: Lab4_tb - Behavioral
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


entity LAB4_tb is
end LAB4_tb;

architecture stimulus of Lab4_tb is

component Lab4 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           mode : in STD_LOGIC;
           en_cross : in STD_LOGIC;
           cross_out : out STD_LOGIC;
           A : out STD_LOGIC_VECTOR(2 downto 0);
           B : out STD_LOGIC_VECTOR(2 downto 0);
           P : out STD_LOGIC_VECTOR(1 downto 0));
end component;

signal A_s, B_s : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal Z_P_s : STD_LOGIC_VECTOR(1 downto 0):= "00";
signal clock_s, en_cross_s, mode_s, cross_out_s, reset_s : STD_LOGIC := '0'; 

begin

UUT : Lab4
    port map(
    clk => clock_s,
    reset => reset_s,
    mode => mode_s,
    en_cross => en_cross_s,
    cross_out => cross_out_s,
    A => A_s,
    B => B_S, 
    P => P_s);
    
    clock_s <= not clock_s after 500ps;
    mode_s <= '1' after 10ns;    

end stimulus;
