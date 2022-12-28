----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2021 09:53:03 PM
-- Design Name: 
-- Module Name: SetOnLessThan_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity SetOnLessThan_tb is
end SetOnLessThan_tb;

architecture Behavioral of SetOnLessThan_tb is

component SetOnLessThan is
  Port (
        func : in std_logic_vector(3 downto 0);
        Borrow : in std_logic;
        DataOut : out unsigned(15 downto 0) 
         );
end component;

signal func_s : std_logic_vector(3 downto 0):= "0000";
signal Borrow_s : std_logic:= '0';
signal DataOut_s : unsigned(15 downto 0) := "0000000000000000";

begin

    UUT: SetOnLessThan
    port map(
    func => func_s,
    Borrow => Borrow_s,
    DataOut => DataOut_s );

func_s <= "1011" after 10ns;
Borrow_s <= '0' after 10ns, '1' after 20ns, '0' after 30ns, '1' after 40ns;

end Behavioral;
