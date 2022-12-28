----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2021 03:45:38 PM
-- Design Name: 
-- Module Name: ALU_tb - stimulus
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

entity ALU_tb is
end ALU_tb;

architecture stimulus of ALU_tb is

component Arithmetic_Logic_Unit is
    Port ( A : in unsigned (15 downto 0);
           B : in unsigned (15 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Out : out unsigned (15 downto 0);
           Overflow_Out : out STD_LOGIC);
end component;

signal A_s, B_s, Z_s : unsigned (15 downto 0) := "0000000000000000";
signal func_s : std_logic_vector (3 downto 0) := "0000";
signal overflow_s : std_logic := '0';
        
begin

    UUT: Arithmetic_Logic_Unit
    port map(
            A => A_s,
            B => B_s,
            Function_Select => func_s,
            Function_Out => Z_s,
            Overflow_Out => overflow_s );
            
func_s <= "0000" after 0ns, "0001" after 10ns, "0010" after 20ns, "0011" after 30ns, "0100" after 40ns, "0101" after 50ns, "0001" after 60ns;
A_s <= "0000000000000001" after 0ns, "0000000000000101" after 10ns, "1111111111111111" after 20ns, "1010101010101010" after 30ns, "0000000000001111" after 40ns, "1111000000000000" after 50ns, "0000000000001111" after 60ns;
B_s <= "0000000000000110" after 0ns, "0000000000000001" after 10ns, "1010101010101010" after 20ns, "0101010101010101" after 30ns, "0000000000000000" after 60ns;

end stimulus;
