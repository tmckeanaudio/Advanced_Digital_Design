----------------------------------------------------------------------------------
-- Company: UMB 
-- Engineer: Zachary Garnes
-- 
-- Create Date: 03/16/2021 03:20:23 PM
-- Design Name: 
-- Module Name: Arithmetic_Logic_Unit - Behavioral
-- Project Name: Lab 2 - ALU Design
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

entity Arithmetic_Logic_Unit is
    generic (N : positive := 16);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Out : out STD_LOGIC_VECTOR (N-1 downto 0);
           Overflow_Out : out STD_LOGIC);
end Arithmetic_Logic_Unit;
        
architecture Behavioral of Arithmetic_Logic_Unit is

component Adder is
    generic(N : INTEGER := 16);
    port(
        A : in STD_LOGIC_VECTOR (N-1 downto 0);
        B : in STD_LOGIC_VECTOR (N-1 downto 0);
        Cin : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (N-1 downto 0);
        Cout : out STD_LOGIC);
end component; 

component Subtractor is 
    generic(N : INTEGER := 16);
    port(
        A : in STD_LOGIC_VECTOR (N-1 downto 0);
        B : in STD_LOGIC_VECTOR (N-1 downto 0);
        Barrow_in : in STD_LOGIC;
        Difference : out STD_LOGIC_VECTOR (N-1 downto 0);
        Barrow_out : out STD_LOGIC);
end component; 

component MUX2to1 is 
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        SEL : in STD_LOGIC_VECTOR (3 downto 0);
        Z : out STD_LOGIC);
end component; 

component MUX8to1 is 
    port(
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        C : in STD_LOGIC_VECTOR (15 downto 0);
        D : in STD_LOGIC_VECTOR (15 downto 0);
        E : in STD_LOGIC_VECTOR (15 downto 0);
        F : in STD_LOGIC_VECTOR (15 downto 0);
        G : in STD_LOGIC_VECTOR (15 downto 0);
        H : in STD_LOGIC_VECTOR (15 downto 0);
        SEL : in STD_LOGIC_VECTOR (3 downto 0);
        Z : out STD_LOGIC_VECTOR (15 downto 0));
end component; 

signal A_out, S_out, And_gate_out, Or_gate_out : STD_LOGIC_VECTOR (15 downto 0);
signal Shift_left_out, Shift_right_out : STD_LOGIC_VECTOR (15 downto 0);
signal A_carry_out, S_barrow_out : STD_LOGIC;
signal low_logic : STD_LOGIC := '0';
begin

Add: Adder 
    generic map (N=>4)
    port map (
    A => A, 
    B => B,
    Cin => low_logic, 
    S => A_out,
    Cout => A_carry_out); 
    
Subtract : Subtractor
    generic map (N=>4) 
    port map (
    A => A, 
    B => B,
    Barrow_in => low_logic,
    Difference => S_out,
    Barrow_out => S_barrow_out);


Mux2 : MUX2to1 port map(
    A => A_carry_out,
    B => S_barrow_out,
    SEL => Function_Select,
    Z => Overflow_Out);

And_Gate : And_gate_out <= (A AND B);
Or_Gate : Or_gate_out <= (A OR B);
Shift_left_func : Shift_left_out <=  A(N-2 downto 0) & '0';
Shift_right_func : Shift_right_out <= '0' & A(N-1 downto 1);

Mux11: MUX8to1 port map(
    A => A_out,
    B => S_out,
    C => And_gate_out,
    D => Or_gate_out,  
    E => Shift_left_out,
    F => Shift_right_out,
    G => A_out,
    H => And_gate_out,
    SEL => Function_Select,
    Z => Function_Out);

end Behavioral;
