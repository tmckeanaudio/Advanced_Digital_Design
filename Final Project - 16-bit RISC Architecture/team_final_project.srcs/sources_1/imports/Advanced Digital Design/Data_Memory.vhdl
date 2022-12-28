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
use IEEE.numeric_std.all;

entity Data_memory is
port(
    clk : in std_logic; -- clock signal
    func : in STD_LOGIC_VECTOR(3 downto 0); -- func select bits from instruction
    AddressFlag: in std_logic;
    Address: in unsigned(7 downto 0); -- Address
    AddressReg: in unsigned(15 downto 0);
    DI: in unsigned (15 downto 0); -- Data In
    DO: out unsigned(15 downto 0) -- Data Out
    );
end Data_memory;

architecture Behavorial of Data_memory is

component MemoryMUX is
    Port ( 
            func : in STD_LOGIC_VECTOR(3 downto 0);
            Mem : in unsigned(15 downto 0);
            A : in unsigned(15 downto 0);
            Z : out unsigned(15 downto 0));
end component;

type DMtype is array(0 to 255) of unsigned (7 downto 0); -- 256 Memory locations due to 8-bit address
signal DM : DMtype := (others => (others => '0'));
signal temp : unsigned(15 downto 0) := "0000000000000000";
signal address_tmp : unsigned(7 downto 0) := "00000000";
signal data1, data2, data3, data4 : unsigned(7 downto 0):= "00000000";

begin
    process (clk) is
    begin
        if  clk'event then
            if func = "1001" AND AddressFlag ='0' then -- if STORE instruction 
                DM(to_integer(Address)) <= DI(15 downto 8);
                DM(to_integer(Address)+1) <= DI(7 downto 0);
            elsif func = "1001" AND AddressFlag = '1' then
                DM(to_integer(AddressReg(7 downto 0))) <= DI(15 downto 8);
                DM(to_integer(AddressReg(7 downto 0)+1)) <= DI(7 downto 0);
            elsif func = "1000" then -- if LOAD instruction
                temp(15 downto 8) <= DM(to_integer(Address));
                temp(7 downto 0) <= DM(to_integer(Address)+1);
            end if;
      end if;
end process;
 
    MUX: MemoryMUX
    port map( 
            func => func,
            Mem => temp,
            A => DI,
            Z => DO );

end Behavorial;