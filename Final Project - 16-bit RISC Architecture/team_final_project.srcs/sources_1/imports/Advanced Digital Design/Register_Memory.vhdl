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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Register_Memory is
port(
    clk : in std_logic;
    func : in STD_LOGIC_VECTOR(3 downto 0);
    AddressFlag : in std_logic;
    SR1 : in unsigned(2 downto 0); -- SR1 Address
    SR2 : in unsigned(2 downto 0); -- SR2 Address
    DR : in unsigned(2 downto 0); -- DR Address
    IM : in unsigned(15 downto 0); -- 16-bit Immediate Value
    DI : in unsigned(15 downto 0); -- Data In
    SR1_DO: out unsigned(15 downto 0); -- SR1 Data Out
    SR2_DO: out unsigned(15 downto 0); -- SR2 Data Out
    MEMREG : out unsigned(15 downto 0); -- Memory Address Register
    AddressReg : out unsigned(15 downto 0)
);
end Register_Memory;

architecture Behavorial of Register_Memory is

component RegisterMUX is 
    Port (  func : in STD_LOGIC_VECTOR(3 downto 0);
            SRD2 : in unsigned(15 downto 0);
            Immediate : in unsigned (15 downto 0);
            Z : out unsigned(15 downto 0));
end component;

type RAMtype is array(0 to 7) of unsigned (15 downto 0); -- 8 Register locations 
signal Registers: RAMtype := (others => (others => '0'));
signal temp1, temp2 : unsigned(15 downto 0);
signal mem_s, address_s : unsigned(15 downto 0):= "0000000000000000";
signal what_is_happening : unsigned(2 downto 0) := "000";

begin
    process (clk) is
    begin
        if (clk'event)  then
            if func(3) = '0' or func = "1000" or func = "1011" then
                Registers(to_integer(DR)) <= DI;
                mem_s <= Registers(to_integer(DR));	
                what_is_happening <= "001";
            elsif func = "1001" AND AddressFlag = '0' then 
                mem_s <= Registers(to_integer(DR));  
                what_is_happening <= "010";        
            elsif func = "1001" AND AddressFlag = '1' then 
                address_s <= Registers(to_integer(SR1));
                mem_s <= Registers(to_integer(DR)); 
                what_is_happening <= "011";            
            end if; 
        end if;
    end process;       
    MEMREG <= mem_s;
    AddressReg <= address_s; 
    SR1_DO <= Registers(to_integer(SR1)); -- read from SR1 address and place values to SR1_DO
	temp2 <= Registers(to_integer(SR2)); -- read from SR2 address and place values to temp2

    MUX: RegisterMUX 
    port map(
            func => func,
            SRD2 => temp2,
            Immediate => IM,
            Z => SR2_DO );

end Behavorial;

