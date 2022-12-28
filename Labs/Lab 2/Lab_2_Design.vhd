library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab_2_Design is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Seg_Output : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow_Out : out STD_LOGIC);
end Lab_2_Design;

architecture Structural of Lab_2_Design is

component Arithmetic_Logic_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow_Out : out STD_LOGIC);
end component;

component Seven_Segment_Driver is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Seven_Seg_In : STD_LOGIC_VECTOR (3 downto 0);

begin

ALU: Arithmetic_Logic_Unit port map (
    A => A,
    B => B,
    Function_Select => Function_Select,
    Function_Out => Seven_Seg_In,
    Overflow_Out => Overflow_Out);
    
LED: Seven_Segment_Driver port map (
    Input => Seven_Seg_In,
    Output => Seg_Output);

end Structural;
