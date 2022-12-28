----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: full_sub - mixed
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: modular design of a full subtractor circuit built from a half subtractor modular component.
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

entity full_sub is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           bor_in : in STD_LOGIC;
           diff : out STD_LOGIC;
           bor_out : out STD_LOGIC);
end full_sub;

architecture mixed of full_sub is

component half_sub1 is
    port(
        a : in STD_LOGIC; 
        b : in STD_LOGIC; 
        diff : out STD_LOGIC; 
        borrow : out STD_LOGIC 
        );
end component;

component half_sub2 is
    port(
        a : in STD_LOGIC; 
        b : in STD_LOGIC; 
        diff : out STD_LOGIC; 
        borrow : out STD_LOGIC 
        );
end component;

signal d1, b1, b2 : STD_LOGIC; 

begin

    hs1: half_sub1 port map (
        a => a,
        b => b,
        diff => d1,
        borrow => b1 );
        
    hs2: half_sub2 port map (
        a => bor_in,
        b => d1,
        diff => diff,
        borrow => b2 );
        
    or_gate: bor_out <= b1 OR b2;

end mixed;