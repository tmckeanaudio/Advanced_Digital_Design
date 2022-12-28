----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: N-bit ripple carry subtractor
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Design of a N-bit Ripple Carry Subtractor made from modular components such as a full sub and half sub design blocks.
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

entity n_bit_ripple_carry_subtractor is
    generic(N : positive := 4);
    Port ( a, b : in STD_LOGIC_VECTOR (N-1 downto 0);        
           bor_in : in STD_LOGIC;
           diff : out STD_LOGIC_VECTOR (N-1 downto 0);
           bor_out : out STD_LOGIC);
end n_bit_ripple_carry_subtractor;

architecture Generated of n_bit_ripple_carry_subtractor is

component full_sub is 
    port( 
        a : in STD_LOGIC; 
        b : in STD_LOGIC;
        bor_in : in STD_LOGIC;
        diff : out STD_LOGIC;
        bor_out : out STD_LOGIC
        );
end component;
-- Internal signals
signal Bc : std_logic_vector (N downto 0); -- Borrow chain

begin
    Bc(0) <= bor_in;
    full_subs: for i in 0 to N-1 generate
                 FSx: full_sub port map (a(i), b(i), BC(i), diff(i), Bc(i+1));
                 end generate;
    bor_out <= Bc(N);  
              
end Generated;
