----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/10/2021 11:07:20 AM
-- Design Name: 
-- Module Name: Lab3_tb - tb_stimulus
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


entity Lab3_tb is
end Lab3_tb;

architecture tb_stimulus of Lab3_tb is

component Lab3 is
   Port (
        A, B : in std_logic_vector (3 downto 0);
        clk, load, up_dn, reset, Enable : in std_logic;
        cathode : out std_logic;
        SegmentOut : out std_logic_vector (6 downto 0));
end component;

signal A_s, B_s : std_logic_vector (3 downto 0):= "0000";
signal clk_s, load_s, up_dn_s, reset_s, Enable_s, cathode_s : std_logic := '0';
signal Seg_Out_s : std_logic_vector (6 downto 0);
        
begin

    UUT: Lab3 
    port map(
        A => A_s,
        B => B_s,
        clk => clk_s,
        load => load_s,
        up_dn => up_dn_s,
        reset => reset_s,
        Enable => Enable_s,
        cathode => cathode_s,
        SegmentOut => Seg_Out_s );
        
    clk_s <= not clk_s after 4ns;

    A_s <= "0001" after 32ns, "0110" after 992ns; 
    
    B_s <= "1001" after 32ns, "0111" after 992ns;
   
    load_s <= '1' after 30ns, '0' after 50ns, '1' after 992ns, '0' after 1040ns; 
    
    reset_s <= '1' after 16ns, '0' after 20ns, '1' after 480ns, '0' after 496ns;
    
    up_dn_s <= '1' after 40ns, '0' after 60ns, '1' after 140ns, '0' after 180ns, '1' after 992ns, '0' after 1040ns;
    
    Enable_s <= '1' after 40ns, '0' after 60ns, '1' after 496ns, '0' after 560ns;

end tb_stimulus;
