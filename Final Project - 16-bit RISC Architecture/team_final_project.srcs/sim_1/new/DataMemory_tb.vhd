----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/01/2021 03:45:38 PM
-- Design Name: 
-- Module Name: DataMemory_tb - stimulus
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

entity DataMemory_tb is
end DataMemory_tb;

architecture stimulus of DataMemory_tb is

component Data_Memory is
port(
    clk : in std_logic; -- clock signal
    func : in STD_LOGIC_VECTOR(3 downto 0); -- func select bits from instruction
    Address: in unsigned(7 downto 0); -- Address
    DI: in unsigned (15 downto 0); -- Data In
    DO: out unsigned(15 downto 0) -- Data Out
    );
end component;

signal clk_s : std_logic:= '1';
signal func_s : std_logic_vector(3 downto 0) := "0000";
signal Add_s : unsigned(7 downto 0) := "00000000";
signal DI_s, DO_s : unsigned(15 downto 0) := "0000000000000000";

begin

    UUT: Data_Memory
    port map(
            clk => clk_s,
            func => func_s,
            Address => Add_s,
            DI => DI_s,
            DO => DO_s );
            
clk_s <= not clk_s after 5 ns;
func_s <= "1001" after 0ns, "1000" after 20ns, "1001" after 40ns, "1000" after 60ns, "0000" after 80ns;
DI_s <= "0000000011111111" after 0ns, "0000000010101010" after 10ns, "0000000000000000" after 20ns,"0000000000001111" after 40ns, "0000000000000000" after 50ns;
Add_s <= "00000000" after 0ns, "00000010" after 10ns, "00000000" after 20ns, "00000010" after 30ns, "00000010" after 40ns, "00000100" after 50ns, "00000010" after 60ns, "00000100" after 70ns;

end stimulus;
