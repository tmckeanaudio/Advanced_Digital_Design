----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:54:56 PM
-- Design Name: 
-- Module Name: Update_PC_tb - Behavioral
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

entity Update_PC_tb is
--  Port ( );
end Update_PC_tb;

architecture Behavioral of Update_PC_tb is

component Update_PC is
    Port ( PC : in STD_LOGIC_VECTOR(7 downto 0);
           Jump_mag : in STD_LOGIC_VECTOR(7 downto 0);
           Branch_Address : in STD_LOGIC_VECTOR(7 downto 0);
           Jump_flag : in STD_LOGIC;
           jump_back_flag: in STD_LOGIC;
           Branch_flag : in STD_LOGIC;
           Address_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal PC_s, Jump_mag_s, Branch_Address_s, Address_out_s : STD_LOGIC_VECTOR(7 downto 0) := "00000000"; 
signal Jump_flag_s, Branch_flag_s, jump_back_flag_s : STD_LOGIC := '0'; 

begin

UTT :  Update_PC
    Port map (
        PC => PC_s,
        Jump_mag => Jump_mag_s, 
        Branch_Address => Branch_Address_s, 
        Jump_flag => Jump_flag_s,
        jump_back_flag => jump_back_flag_s,
        Branch_flag => Branch_flag_s,
        Address_out => Address_out_s );

Jump_mag_s <= "00000100" after 0ns; 
PC_s <= Address_out_s after 2ns;
Branch_flag_s <= '1' after 4ns, '0' after 6ns; 
Jump_flag_s <= '1' after 8ns, '0' after 10ns, '1' after 16ns, '0' after 18ns; 
jump_back_flag_s <= '1' after 16ns, '0' after 18ns;


end Behavioral;
