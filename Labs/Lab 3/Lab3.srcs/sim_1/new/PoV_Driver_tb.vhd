----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/07/2021 08:59:22 PM
-- Design Name: 
-- Module Name: PoV_Driver_tb - PoV_tb_stimulus
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

entity PoV_Driver_tb is
end PoV_Driver_tb;

architecture PoV_tb_stimulus of PoV_Driver_tb is

component SS_PoV_Driver is
  Port ( 
        clk : in std_logic;
        MSD, LSD : in std_logic_vector (3 downto 0);
        cathode : out std_logic;
        Seg_Out : out std_logic_vector (6 downto 0));
end component;

component clk_divider is
    generic (N: positive);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component; 

signal clkin, clkout, cat_s : std_logic:= '0';
signal MSD_s, LSD_s : std_logic_vector (3 downto 0):= "0000";
signal SegOut_s : std_logic_vector (6 downto 0):= "0000000";

begin

    Clock_Divder: clk_divider
    generic map (N => 250000)
    port map(
        clk_in => clkin,
        clk_out => clkout);

    UUT: SS_PoV_Driver 
    port map(
        clk => clkout,
        MSD => MSD_s,
        LSD => LSD_s,
        cathode => cat_s,
        Seg_Out => SegOut_s );
        
        clkin <= not clkin after 4ns;
        
        LSD_s <= "0001" after 0ns, "0100" after 1ms, "0101" after 3ms, "1001" after 5ms;
        MSD_s <= "0100" after 0ns, "0110" after 1ms, "1000" after 3ms, "1000" after 5ms; 


end PoV_tb_stimulus;
