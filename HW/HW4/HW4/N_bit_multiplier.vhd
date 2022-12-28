----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/05/2021 07:47:22 PM
-- Design Name: 
-- Module Name: N_bit_multiplier - Generated
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

entity Four_bit_multiplier is
    generic(N : positive:= 4);
    Port ( A, B : in STD_LOGIC_VECTOR (N-1 downto 0);
           P : out STD_LOGIC_VECTOR ((2*N)-1 downto 0));
end Four_bit_multiplier;

architecture Generated of Four_bit_multiplier is

component full_adder is
    port( 
        A, B, Cin : in STD_LOGIC; 
        Cout, S : out STD_LOGIC);
end component;


signal C1, C2, C3: std_logic_vector(N downto 0);
signal S1, S2, S3: std_logic_vector(N-1 downto 0);
signal AB0, AB1, AB2, AB3: std_logic_vector(N-1 downto 0);

begin

    ABx: for i in 0 to N-1 generate
    AB0(i) <= A(i) AND B(0);
    AB1(i) <= A(i) AND B(1);
    AB2(i) <= A(i) AND B(2);
    AB3(i) <= A(i) AND B(3);
    end generate;
    
    C1(0) <= '0';
    C2(0) <= '0';
    C3(0) <= '0';
     
    FA1: full_adder port map(AB1(0),AB0(1),C1(0),C1(1),S1(0));
    FA2: full_adder port map(AB1(1),AB0(2),C1(1),C1(2),S1(1));
    FA3: full_adder port map(AB2(0),S1(1),C2(0),C2(1),S2(0));
    FA4: full_adder port map(AB1(2),AB0(3),C1(2),C1(3),S1(2));
    FA5: full_adder port map(AB2(1),S1(2),C2(1),C2(2),S2(1));
    FA6: full_adder port map(AB3(0),S2(1),C3(0),C3(1),S3(0));
    FA7: full_adder port map(AB1(3),'0',C1(3),C1(4),S1(3));
    FA8: full_adder port map(AB2(2),S1(3),C2(2),C2(3),S2(2));
    FA9: full_adder port map(AB3(1),S2(2),C3(1),C3(2),S3(1));
    FA10: full_adder port map(AB2(3),C1(4),C2(3),C2(4),S2(3));
    FA11: full_adder port map(AB3(2),S2(3),C3(2),C3(3),S3(2));
    FA12: full_adder port map(AB3(3),C2(4),C3(3),C3(4),S3(3));
    
    P(0) <= AB0(0);
    P(1) <= S1(0);
    P(2) <= S2(0);
    P(3) <= S3(0);
    P(4) <= S3(1);
    P(5) <= S3(2);
    P(6) <= S3(3);
    P(7) <= C3(3);
   
end Generated;
