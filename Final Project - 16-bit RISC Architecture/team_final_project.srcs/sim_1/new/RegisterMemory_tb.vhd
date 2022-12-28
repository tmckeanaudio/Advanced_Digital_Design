----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/01/2021 03:45:38 PM
-- Design Name: 
-- Module Name: RegisterMemory_tb - stimulus
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

entity RegisterMemory_tb is
end RegisterMemory_tb;

architecture stimulus of RegisterMemory_tb is

component Register_Memory is 
port(
    clk : in std_logic;
    func : in STD_LOGIC_VECTOR(3 downto 0);
    SR1 : in unsigned(2 downto 0); -- SR1 Address
    SR2 : in unsigned(2 downto 0); -- SR2 Address
    DR : in unsigned(2 downto 0); -- DR Address
    IM : in unsigned(15 downto 0); -- 16-bit Immediate Value
    DI : in unsigned(15 downto 0); -- Data In
    SR1_DO: out unsigned(15 downto 0); -- SR1 Data Out
    SR2_DO: out unsigned(15 downto 0); -- SR2 Data Out
    MEMREG : out unsigned(15 downto 0) -- Memory Address Register
);
end component;

signal clk_s : std_logic := '1';
signal func_s : std_logic_vector(3 downto 0) := "0000";
signal SR1_s, SR2_s, DR_s : unsigned(2 downto 0) := "000";
signal IM_s, DI_s, SR1_DO_s, SR2_DO_s, MEMREG_s : unsigned(15 downto 0) := "0000000000000000";

begin

    UUT: Register_Memory
    port map(
        clk => clk_s,
        func => func_s,
        SR1 => SR1_s,
        SR2 => SR2_s,
        DR => DR_s,
        IM => IM_s,
        DI => DI_s,
        SR1_DO => SR1_DO_s,
        SR2_DO => SR2_DO_s,
        MEMREG => MEMREG_S );
            
clk_s <= not clk_s after 5ns;
func_s <= "1000" after 0ns, "0000" after 30ns, "0110" after 40ns, "1000" after 50ns, "0001" after 70ns;
DR_s <= "000" after 0ns, "001" after 10ns, "010" after 20ns, "101" after 50ns, "110" after 60ns;
DI_s <= "0000000011111010" after 0ns, "0000111100001111" after 10ns, "0000000010101011" after 20ns, "0000000000001111" after 50ns, "0000000000000000" after 60ns;
IM_s <= "0000000000000101" after 0ns;
SR1_s <= "000" after 10ns, "010" after 30ns, "101" after 50ns;
SR2_s <= "001" after 10ns, "110" after 60ns;

end stimulus;
