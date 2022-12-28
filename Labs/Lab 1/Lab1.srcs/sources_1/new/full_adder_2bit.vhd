----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: full_adder_2bit - structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Design of a 2-bit full adder made from modular components such as a full adder and half adder design blocks.
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

entity full_adder_2bit is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (1 downto 0);
           carry_out : out STD_LOGIC);
end full_adder_2bit;

architecture structural of full_adder_2bit is

component full_adder is 
    port( 
        a : in STD_LOGIC; 
        b : in STD_LOGIC;
        carry_in : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry_out : out STD_LOGIC
        );
end component;

signal cin_fa1 : STD_LOGIC;

begin

fa0: full_adder port map (
    a => a(0),
    b => b(0),
    carry_in => carry_in,
    sum => sum(0),
    carry_out => cin_fa1 );
    
fa1: full_adder port map (
    a => a(1),
    b => b(1),
    carry_in => cin_fa1,
    sum => sum(1),
    carry_out => carry_out );
    
end structural;
