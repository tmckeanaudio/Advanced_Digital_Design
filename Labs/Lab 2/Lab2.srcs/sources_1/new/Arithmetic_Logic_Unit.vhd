----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 03/14/2021 10:27:29 AM
-- Design Name: 
-- Module Name: Arithmetic_Logic_Unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: ALU Unit that combines the input vectors A,B, and Function Select with Overflow MUX and Output MUX
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

entity Arithmetic_Logic_Unit is
    generic (N: positive:= 4);
    Port ( 
    A,B: in std_logic_vector(N-1 downto 0);
    Function_Select: in std_logic_vector (N-1 downto 0);
    Overflow: out std_logic;
    R: out std_logic_vector(N-1 downto 0));
    
end Arithmetic_Logic_Unit;

architecture Behavioral of Arithmetic_Logic_Unit is

component Overflow_MUX is
    Port( 
        Cout, Bout: in std_logic; 
        Function_Select: in std_logic_vector (N-1 downto 0);
        Overflow_out: out std_logic );
end component;

component Output_MUX is
    Port( 
        ADD_OP: in std_logic_vector (N-1 downto 0);
        SUB_OP: in std_logic_vector (N-1 downto 0);
        TWOS_COMP_OP: in std_logic_vector (N-1 downto 0);
        AND_OP: in std_logic_vector (N-1 downto 0);
        OR_OP: in std_logic_vector (N-1 downto 0);
        XOR_OP: in std_logic_vector (N-1 downto 0);
        NOT_OP: in std_logic_vector (N-1 downto 0);
        ShiftLeft: in std_logic_vector (N-1 downto 0);
        ShiftRight: in std_logic_vector (N-1 downto 0);
        RotateLeft: in std_logic_vector (N-1 downto 0);
        RotateRight: in std_logic_vector (N-1 downto 0);
        Function_Select: in std_logic_vector (N-1 downto 0);
        Output: out std_logic_vector (N-1 downto 0)); 
end component;

component n_bit_ripple_carry_adder is
    Port ( a, b : in STD_LOGIC_VECTOR (N-1 downto 0);        
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (N-1 downto 0);
           carry_out : out STD_LOGIC);
end component;      

component n_bit_ripple_carry_subtractor is
    Port ( a, b : in STD_LOGIC_VECTOR (N-1 downto 0);        
           bor_in : in STD_LOGIC;
           diff : out STD_LOGIC_VECTOR (N-1 downto 0);
           bor_out : out STD_LOGIC);
end component;

component Twos_Complement is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (3 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
      
signal Cin, Bin, Carry_out, Borrow_out : std_logic; 
signal sum, diff, twos, add_in, sub_in, and_in, or_in, xor_in, not_in, shiftleft_in, shiftright_in, rotateleft_in, rotateright_in : std_logic_vector(N-1 downto 0);
signal add, sub, and_out, or_out, xor_out, not_out, sl_out, sr_out, rl_out, rr_out: std_logic_vector (N-1 downto 0);
begin
    OverflowMUX: Overflow_MUX port map(
        Cout => Carry_out,
        Bout => Borrow_out,
        Function_Select => Function_select,
        Overflow_out => Overflow );  
    Ripple_Adder: n_bit_ripple_carry_adder port map(
        a => A,
        b => B,
        carry_in => '0',
        sum => sum,
        carry_out => Carry_out );
    Ripple_Subtractor: n_bit_ripple_carry_subtractor port map(
        a => A,
        b => B,
        bor_in => '0',
        diff => diff,
        bor_out => Borrow_out );
    TwosComp: Twos_Complement port map(
        Diff_Input => diff,
        Twos_Comp_Out => twos );
    
    AND_GATE: and_out <= A and B;
    OR_GATE: or_out <= A or B; 
    XOR_GATE: xor_out <= A xor B;
    NOT_GATE: not_out <= not A;
    SHIFTLEFT: sl_out <= A(N-2 downto 0) & '0';
    SHIFTRIGHT: sr_out <= '0' & A(N-1 downto 1);
    ROTATELEFT: rl_out <= A(N-2 downto 0) & A(N-1);
    ROTATERIGHT: rr_out <= A(0) & A(N-1 downto 1);
    
    OutputMUX: Output_MUX port map(
        ADD_OP => sum,
        SUB_OP => diff,
        TWOS_COMP_OP => twos, 
        AND_OP => and_out,
        OR_OP => or_out,
        XOR_OP => xor_out, 
        NOT_OP => not_out, 
        ShiftLeft => sl_out, 
        ShiftRight => sr_out,
        RotateLeft => rl_out, 
        RotateRight => rr_out, 
        Function_Select => Function_Select, 
        Output => R ); 
end Behavioral;
