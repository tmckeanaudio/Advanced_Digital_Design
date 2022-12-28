library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Twos_Complement is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (3 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (3 downto 0));
end Twos_Complement;

architecture Dataflow of Twos_Complement is

begin

    Twos_Comp_Out(0) <= Diff_Input(0);
    Twos_Comp_Out(1) <= Diff_Input(1) XOR Diff_Input(0);
    Twos_Comp_Out(2) <= Diff_Input(2) XOR (Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(3) <= Diff_Input(3) XOR (Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    
end Dataflow;
