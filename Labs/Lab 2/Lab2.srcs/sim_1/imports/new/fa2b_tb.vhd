----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 02/13/2021 05:24:07 PM
-- Design Name: 
-- Module Name: fa2b_tb - fa2b_tb_stimulus
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

entity fa2b_tb is
end fa2b_tb;

architecture fa2b_tb_stimulus of fa2b_tb is

component full_adder_2bit is 
    port( 
        a : in STD_LOGIC_VECTOR (1 downto 0);
        b : in STD_LOGIC_VECTOR (1 downto 0);
        carry_in : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (1 downto 0);
        carry_out : out STD_LOGIC 
        );
               
end component;
-- Stimulus signals initialized to '0'
signal a0_s, a1_s, b0_s, b1_s, cin_s, sum0_s, sum1_s, cout_s : STD_LOGIC := '0';

begin
-- Instantiate a Unit Under Test (UUT) and connect to internal stimuli
    UUT: full_adder_2bit port map (
        a(0) => a0_s,
        a(1) => a1_s,
        b(0) => b0_s,
        b(1) => b1_s,
        carry_in => cin_s,
        sum(0) => sum0_s,
        sum(1) => sum1_s,
        carry_out => cout_s );
        
    a0_s <= not a0_s after 160ns;
    a1_s <= not a1_s after 80ns;
    b0_s <= not b0_s after 40ns;
    b1_s <= not b1_s after 20ns;
    cin_s <= not cin_s after 10 ns;
        
end fa2b_tb_stimulus;
