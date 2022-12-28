----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: full_adder - mixed
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: modular design of a full adder circuit built from a half adder modular component intended to be used for a 2-bit full adder design.
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

entity full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder;

architecture mixed of full_adder is

component half_adder is
    port(
        a : in STD_LOGIC; 
        b : in STD_LOGIC; 
        sum : out STD_LOGIC; 
        carry : out STD_LOGIC 
        );
end component;

signal s1, c1, c2 : STD_LOGIC; 

begin

    ha1: half_adder port map (
        a => a,
        b => b,
        sum => s1,
        carry => c1 );
        
    ha2: half_adder port map (
        a => carry_in,
        b => s1,
        sum => sum,
        carry => c2 );
        
    or_gate: carry_out <= c1 OR c2;

end mixed;
