----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 05:03:40 PM
-- Design Name: 
-- Module Name: Update_PC - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Update_PC is
    Port ( PC : in STD_LOGIC_VECTOR(7 downto 0);
           Jump_mag : in STD_LOGIC_VECTOR(7 downto 0);
           Branch_Address : in STD_LOGIC_VECTOR(7 downto 0);
           Jump_flag : in STD_LOGIC;
           jump_back_flag: in STD_LOGIC;
           Branch_flag : in STD_LOGIC;
           Address_out : out STD_LOGIC_VECTOR(7 downto 0));
end Update_PC;

architecture Behavioral of Update_PC is

component Adder is
    generic(N : INTEGER := 8);
    port(
        A : in STD_LOGIC_VECTOR (N-1 downto 0);
        B : in STD_LOGIC_VECTOR (N-1 downto 0);
        Cin : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (N-1 downto 0);
        Cout : out STD_LOGIC);
end component;

component Subtractor is 
    generic(N : INTEGER := 8);
    port(
        A : in STD_LOGIC_VECTOR (N-1 downto 0);
        B : in STD_LOGIC_VECTOR (N-1 downto 0);
        Barrow_in : in STD_LOGIC;
        Difference : out STD_LOGIC_VECTOR (N-1 downto 0);
        Barrow_out : out STD_LOGIC);
end component;

component MUX2to1_1bit is 
    port(
        A : in STD_LOGIC_VECTOR(7 downto 0);
        B : in STD_LOGIC_VECTOR(7 downto 0);
        SEL : in STD_LOGIC;
        Z : out STD_LOGIC_VECTOR(7 downto 0));
end component; 

component MUX3to1 is
    Port ( Default_PC : in STD_LOGIC_VECTOR(7 downto 0);
           Jump : in STD_LOGIC_VECTOR(7 downto 0);
           Branch : in STD_LOGIC_VECTOR(7 downto 0);
           SEL : in STD_LOGIC_VECTOR(1 downto 0);
           PC_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component Control_select is
    Port ( Jump : in STD_LOGIC;
           Branch : in STD_LOGIC;
           SEL : out STD_LOGIC_VECTOR(1 downto 0));
end component;


signal default_add_2 : STD_LOGIC_VECTOR(7 downto 0) := "00000010";
signal default_PC_s, jump_mag_s, jump_PC_s, jumpF_PC_s, jumpB_PC_s, branch_PC_s, PC_s : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal control_s : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal low_logic : STD_LOGIC := '0'; 
signal two_carry_out, jump_carry_out, barrow_out_s : STD_LOGIC := '0';

begin

controller : Control_select 
    port map(
        Jump => Jump_flag,
        Branch => Branch_flag,
        SEL => control_s); 
 
 default_adder : Adder 
    generic map (N=>8)
        port map (
        A => PC, 
        B => default_add_2,
        Cin => low_logic, 
        S => default_PC_s,
        Cout => two_carry_out);

Shift_left_func : Jump_mag_s <= jump_mag(6 downto 0) & '0';
        
jump_adder : Adder 
    generic map (N=>8)
    port map (
        A => PC, 
        B => Jump_mag_s,
        Cin => low_logic, 
        S => jumpF_PC_s,
        Cout => jump_carry_out); 
        
Subtract : Subtractor
    generic map (N=>8) 
    port map (
    A => PC, 
    B => Jump_mag_s,
    Barrow_in => low_logic,
    Difference => jumpB_PC_s,
    Barrow_out => barrow_out_s);
       
Mux2 : MUX2to1_1bit 
    port map(
        A => jumpF_PC_s,
        B => jumpB_PC_s,
        SEL => jump_back_flag,
        Z => jump_PC_s);

Mux1 : MUX3to1
    port map(
        Default_PC => default_PC_s,
        Jump => jump_PC_s,
        Branch => Branch_Address,
        SEL => control_s,
        PC_out => PC_s );

Address_out <= PC_s; 

end Behavioral;
