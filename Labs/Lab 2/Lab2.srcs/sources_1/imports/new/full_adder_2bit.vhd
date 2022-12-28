----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/13/2021 03:59:41 PM
-- Design Name: 
-- Module Name: full_adder_2bit - structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Design of a N-bit Ripple Carry Adder made from modular components such as a full adder and half adder design blocks.
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

entity n_bit_ripple_carry_adder is
    generic(N : positive:= 4);
    Port ( a, b : in STD_LOGIC_VECTOR (N-1 downto 0);        
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (N-1 downto 0);
           carry_out : out STD_LOGIC);
end n_bit_ripple_carry_adder;

architecture Generated of n_bit_ripple_carry_adder is

component full_adder is 
    port( 
        a : in STD_LOGIC; 
        b : in STD_LOGIC;
        carry_in : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry_out : out STD_LOGIC
        );
end component;
-- Internal signals
signal Cc : std_logic_vector (N downto 0); -- Carry chain

begin
    Cc(0) <= carry_in;
    full_adders: for i in 0 to N-1 generate
                 FAx: full_adder port map (A(i), B(i), CC(i), sum(i), Cc(i+1));
                 end generate;
    carry_out <= Cc(N);  
              
end Generated;

