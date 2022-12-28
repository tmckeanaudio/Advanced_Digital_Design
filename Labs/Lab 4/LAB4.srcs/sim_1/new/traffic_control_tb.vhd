----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/21/2021 11:52:19 PM
-- Design Name: 
-- Module Name: traffic_control_tb - Behavioral
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

entity traffic_control_tb is
end traffic_control_tb;

architecture Behavioral of traffic_control_tb is

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
signal clk_s, en_cross_s, mode_s, cross_out_s, rst_s : STD_LOGIC := '0'; 

begin

    UUT : Traffic_Controller
        port map(
        clk => clk_s,
        rst => rst_s,
        mode => mode_s,
        en_cross => en_cross_s,
        cross_out => cross_out_s,
        A => A_s,
        B => B_S, 
        P => P_s);
    
    clk_s <= not clk_s after 4ns;
    en_cross_s <= '1' after 72ns, '0' after 74ns;
    mode_s <= '1' after 124ns, '0' after 156ns;
    rst_s <= '1' after 156ns, '0' after 158ns;

end Behavioral;
