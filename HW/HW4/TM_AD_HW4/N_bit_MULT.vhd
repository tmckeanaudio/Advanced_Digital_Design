----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/10/2021 08:50:13 PM
-- Design Name: 
-- Module Name: N_bit_MULT - Behavioral
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

entity N_bit_MULT is
generic(N : positive:= 8);
    Port ( A, B : in STD_LOGIC_VECTOR (N-1 downto 0);
           P : out STD_LOGIC_VECTOR ((2*N)-1 downto 0));
end N_bit_MULT;

architecture Behavioral of N_bit_MULT is

component full_adder is
    port( 
        A, B, Cin : in STD_LOGIC; 
        Cout, S : out STD_LOGIC);
end component;


signal C1, C2, C3, C4, C5, C6, C7: STD_LOGIC_VECTOR(N downto 0);
signal S1, S2, S3, S4, S5, S6, S7: std_logic_vector(N downto 0);
signal AB1, AB2, AB3, AB4, AB5, AB6, AB7: std_logic_vector(N-1 downto 0);
signal AB0 : std_logic_vector (N downto 0);
begin


    ABx: for i in 0 to N-1 generate
    AB0(i) <= A(i) AND B(0);
    AB1(i) <= A(i) AND B(1);
    AB2(i) <= A(i) AND B(2);
    AB3(i) <= A(i) AND B(3);
    AB4(i) <= A(i) AND B(4);
    AB5(i) <= A(i) AND B(5);
    AB6(i) <= A(i) AND B(6);
    AB7(i) <= A(i) AND B(7);
    end generate;
    
    AB0(8) <= '0';
    
    C1(0) <= '0'; S1(8) <= '0';
    C2(0) <= '0'; S2(8) <= '0';
    C3(0) <= '0'; S3(8) <= '0';
    C4(0) <= '0'; S4(8) <= '0';
    C5(0) <= '0'; S5(8) <= '0';
    C6(0) <= '0'; S6(8) <= '0';
    C7(0) <= '0'; S7(8) <= '0';
    
    
    full_adders: for i in 0 to N-1 generate
                    FA1: full_adder port map (AB1(i),AB0(i+1),C1(i),C1(i+1),S1(i));
                    FA2: full_adder port map (AB2(i),S1(i+1),C2(i),C2(i+1),S2(i));
                    FA3: full_adder port map (AB3(i),S2(i+1),C3(i),C3(i+1),S3(i));
                    FA4: full_adder port map (AB4(i),S3(i+1),C4(i),C4(i+1),S4(i));
                    FA5: full_adder port map (AB5(i),S4(i+1),C5(i),C5(i+1),S5(i));
                    FA6: full_adder port map (AB6(i),S5(i+1),C6(i),C6(i+1),S6(i));
                    FA7: full_adder port map (AB7(i),S6(i+1),C7(i),C7(i+1),S7(i));
    end generate;
     
    P(0) <= AB0(0);
    P(1) <= S1(0);
    P(2) <= S2(0);
    P(3) <= S3(0);
    P(4) <= S4(0);
    P(5) <= S5(0);
    P(6) <= S6(0);
    P(7) <= S7(0);
    P(8) <= S7(1);
    P(9) <= S7(2);
    P(10) <= S7(3);
    P(11) <= S7(4);
    P(12) <= S7(5);
    P(13) <= S7(6);
    P(14) <= S7(7);
    P(15) <= C7(8);
    
end Behavioral;
