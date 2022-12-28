----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:34:53 PM
-- Design Name: 
-- Module Name: Control_select_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control_select_tb is
--  Port ( );
end Control_select_tb;

architecture Behavioral of Control_select_tb is

component Control_select is
    Port ( Jump : in STD_LOGIC;
           Branch : in STD_LOGIC;
           SEL : out STD_LOGIC_VECTOR(1 downto 0));
end component;

signal jump_s, Branch_s : STD_LOGIC := '0'; 
signal SEL_s : STD_LOGIC_VECTOR(1 downto 0) := "00";

begin

UTT : Control_select 
    port map(
        Jump =>jump_s,
        Branch => Branch_s, 
        SEL => SEL_s);
        
    Jump_s <= not jump_s after 4ns;
    Branch_s <= not Branch_s after 2ns; 


end Behavioral;
