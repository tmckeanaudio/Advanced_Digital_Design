----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 07:41:05 PM
-- Design Name: 
-- Module Name: RISC_Architecture - Structural
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
use IEEE.NUMERIC_STD.ALL;

entity RISC_Architecture is
  Port (
        clk : in std_logic );
end RISC_Architecture;

architecture Structural of RISC_Architecture is

component Inst_Mem is
    port(
        address : in unsigned(7 downto 0); --takes pc as input
        Inst_Set : out unsigned(15 downto 0)
        );
end component;

component Inst_Execution_Block is
    Port (  
            clk : in std_logic;
            Inst : in unsigned(15 downto 0); -- 16-bit Instruction from Instruction Memory
            Z : out unsigned(15 downto 0); -- 16- bit Output from ALU
            JumpOffset : out unsigned (7 downto 0);
            JumpFlag : out std_logic;
            BranchFlag : out std_logic;
            FoB : out std_logic;
            PC_Address : out unsigned(7 downto 0) );
end component;

component Update_PC is
    Port ( PC : in unsigned(7 downto 0);
           Jump_mag : in unsigned(7 downto 0);
           Branch_Address : in unsigned(7 downto 0);
           Jump_flag : in STD_LOGIC;
           jump_back_flag: in STD_LOGIC;
           Branch_flag : in STD_LOGIC;
           Address_out : out unsigned(7 downto 0));
end component;


signal jumpFlag, branchFlag, fobFlag : std_logic := '0';
signal Instruction, Z_out : unsigned(15 downto 0) := "0000000000000000";
signal jumpMag, branchAddress, PC_current, PC_next : unsigned (7 downto 0) := "00000000";
type statetype is (S0, S1, S2);
signal state: statetype:= S0;

begin

    Program_Memory: Inst_Mem 
    port map(
        address => PC_current,
        Inst_Set => Instruction );

    Decode_Execution_Block: Inst_Execution_Block
    port map (  
    clk => clk,
    Inst => Instruction,
    Z => Z_out,
    JumpOffset => jumpMag,
    JumpFlag => jumpFlag,
    BranchFlag => branchFlag,
    FoB => fobFlag,
    PC_Address => branchAddress );
            
    UpdatePC: Update_PC
    port map ( 
    PC => PC_current,
    Jump_mag => jumpMag,
    Branch_Address => branchAddress,
    Jump_flag => jumpFlag,
    jump_back_flag => fobFlag,
    Branch_flag => branchFlag,
    Address_out => PC_next );

    FSM: process(clk)
    begin
    if (clk = '1' AND clk'EVENT) then
        PC_current <= PC_next;
--        case state is 
--            when S0 => 
--                state <= S1;
--            when S1 => 
--                state <= S2;
--            when S2 => 
--                state <= S0;
--                PC_current <= PC_next;
--            end case;
        end if;
    end process;   

end Structural;
