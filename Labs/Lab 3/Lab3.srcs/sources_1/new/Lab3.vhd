----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/08/2021 08:51:40 PM
-- Design Name: 
-- Module Name: Lab3 - Structural
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

entity Lab3 is
 Port (
        A, B : in std_logic_vector (3 downto 0);
        clk, load, up_dn, reset, Enable : in std_logic;
        cathode : out std_logic;
        SegmentOut : out std_logic_vector (6 downto 0));
end Lab3;

architecture Structural of Lab3 is

component clk_divider is
    generic (N: positive);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component; 
           
component toggler is 
    port(
		clk : in  std_logic;
		rst : in  std_logic;
		A   : in  std_logic;
		Z   : out std_logic );
end component;

component counter is
    port(
		rst      : in  STD_LOGIC;
		clk      : in  STD_LOGIC;
		ld       : in  STD_LOGIC;
		en       : in  STD_LOGIC;
		up_dn    : in  STD_LOGIC;
		D        : in  STD_LOGIC_VECTOR(3 downto 0);
		overflow : out STD_LOGIC;
		Q        : out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component SS_PoV_Driver is
  Port ( 
        clk : in std_logic;
        MSD, LSD : in std_logic_vector (3 downto 0);
        cathode : out std_logic;
        Seg_Out : out std_logic_vector (6 downto 0));
end component;

signal A_in, B_in, MSD_out, LSD_out : std_logic_vector (3 downto 0);
signal load_i, up_dn_i, reset_i, Enable_i, clk_i : std_logic;
signal toggle_clk, counter_clk, PoV_clk : std_logic;
signal UpDn_toggle, EN_toggle, EN_btw, cathode_s : std_logic;
signal overflow_s : std_logic := '0';
signal SS_out : std_logic_vector (6 downto 0);

begin

    Toggle_Clock: clk_divider 
        generic map (N => 1)
        port map(
            clk_in => clk,
            clk_out => toggle_clk );
            
    Counter_Clock: clk_divider
        generic map (N => 2)
        port map (
            clk_in => clk,
            clk_out => counter_clk );
            
    PoV_Clock: clk_divider
        generic map (N => 2)
        port map (
            clk_in => clk,
            clk_out => PoV_clk );  

    Enable_Toggle: toggler
        port map(
           clk => toggle_clk,
	       rst => reset,
		   A => Enable,
		   Z => EN_toggle );
		   
    Up_Dn_Toggle: toggler
        port map(
           clk => toggle_clk,
	       rst => reset,
		   A => up_dn,
		   Z => UpDn_toggle ); 
       
    LSD_BCD_Counter: counter
        port map(
          rst => reset,
		  clk => counter_clk,
		  ld => load,
		  en => EN_toggle,
		  up_dn => UpDn_toggle,
		  D => B,
		  overflow => EN_btw,
		  Q => LSD_out );		   
           
    MSD_BCD_Counter: counter
        port map(
          rst => reset,
		  clk => counter_clk,
		  ld => load,
		  en => EN_btw,
		  up_dn => UpDn_toggle,
		  D => A,
		  overflow => overflow_s,
		  Q => MSD_out );		
		  
    POV_DRIVER: SS_PoV_Driver
        port map(
            clk => PoV_clk,
            MSD => MSD_out,
            LSD => LSD_out,
            cathode => cathode,
            Seg_Out => SegmentOut );   
                   		               
end Structural;
