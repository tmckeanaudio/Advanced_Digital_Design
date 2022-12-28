----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/20/2021 06:20:23 AM
-- Design Name: 
-- Module Name: Lab4 - Behavioral
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

entity Lab4 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           mode : in STD_LOGIC;
           en_cross : in STD_LOGIC;
           cross_out : out STD_LOGIC;
           A : out STD_LOGIC_VECTOR(2 downto 0);
           B : out STD_LOGIC_VECTOR(2 downto 0);
           P : out STD_LOGIC_VECTOR(1 downto 0));
end Lab4;

architecture Behavioral of Lab4 is

component clock_divider is
    generic (N : positive := 125000000);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component Traffic_Controller is
    Port ( 
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           mode : in STD_LOGIC;
           en_cross : in STD_LOGIC;
           cross_out : out STD_LOGIC;
           A : out STD_LOGIC_VECTOR(2 downto 0);
           B : out STD_LOGIC_VECTOR(2 downto 0);
           P : out STD_LOGIC_VECTOR(1 downto 0));
end component;

signal A_s, B_s : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal P_s : STD_LOGIC_VECTOR(1 downto 0):= "00";
signal new_clock, cross_out_s : STD_LOGIC := '0'; 


begin

    Clock: clock_divider 
        generic map(N=>125000000)
        port map (
        clk_in => clk,
        clk_out => new_clock);
    
    Traffic_Lights : Traffic_Controller 
    port map(
    rst => rst,
    clk => new_clock,
    mode => mode,
    en_cross => en_cross,
    cross_out => cross_out_s, 
    A => A_s, 
    B => B_s, 
    P => P_s);
    
    A <= A_s;
    B <= B_s; 
    P <= P_s;
    cross_out <= cross_out_s; 
    
end Behavioral;
