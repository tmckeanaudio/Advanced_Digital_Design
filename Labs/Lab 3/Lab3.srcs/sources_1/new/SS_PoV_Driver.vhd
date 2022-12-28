----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/06/2021 10:07:56 PM
-- Design Name: 
-- Module Name: SS_PoV_Driver - Behavioral
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

entity SS_PoV_Driver is
  Port ( 
        clk : in std_logic;
        MSD, LSD : in std_logic_vector (3 downto 0);
        cathode : out std_logic;
        Seg_Out : out std_logic_vector (6 downto 0));
end SS_PoV_Driver;

architecture Behavioral of SS_PoV_Driver is

component clk_divider is
    generic (N: positive:= 250000);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component Cathode_Block is
    Port ( clk : in std_logic;
           cat_mux : out std_logic; 
           cat_out : out std_logic );
end component;

component PoV_Mux is
    Port ( MUX_MSD : in STD_LOGIC_VECTOR (3 downto 0);
           MUX_LSD : in STD_LOGIC_VECTOR (3 downto 0);
           MUX_cathode : in STD_LOGIC;
           MUX_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Seven_Segment_Driver is
    Port ( SS_Input : in STD_LOGIC_VECTOR (3 downto 0);
           SS_Output : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal cat_i : std_logic := '0';
signal MUX_i : std_logic_vector(3 downto 0);

function loadSegment (cat_s : std_logic; LSD_sel: std_logic_vector; MSD_sel: std_logic_vector)
    return std_logic_vector is
    variable SO: std_logic_vector(6 downto 0);
    variable input: std_logic_vector(3 downto  0);

begin
    if(cat_s = '0') then
        input := LSD_sel;
    elsif (cat_s = '1') then
        input := MSD_sel;
    end if;
    case input is
        when "0000" => SO := "0111111";
        when "0001" => SO := "0000110";
        when "0010" => SO := "1011011";
        when "0011" => SO := "1001111";
        when "0100" => SO := "1100110";
        when "0101" => SO := "1101101";
        when "0110" => SO := "1111101";
        when "0111" => SO := "0000111";
        when "1000" => SO := "1111111";
        when "1001" => SO := "1100111";
        when others => SO := "0000000";
    end case;
    return SO;
end function;

begin
    process(clk)
    begin
        if (clk' EVENT) and (clk = '1') then
        cat_i <= not cat_i;
        Seg_out <= loadSegment(cat_i,LSD,MSD);
        cathode <= cat_i;
    end if;
end process;

--    MUX_1: PoV_Mux port map(
--    MUX_MSD => MSD,
--    MUX_LSD => LSD,
--    MUX_cathode => cat_i,
--    MUX_OUT => MUX_i );
    
--    MUX_2: Seven_Segment_Driver port map(
--    SS_Input => MUX_i,
--    SS_Output => Seg_Out );
    
--    Cat_Block: Cathode_Block port map(
--    clk => new_clk,
--    cat_mux => cat_i,
--    cat_out => cathode );
    
end Behavioral;
