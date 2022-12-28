----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/01/2021 10:00:00 PM
-- Design Name: 
-- Module Name: Inst_Execution_Block - Behavioral
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

entity Inst_Execution_Block is
    Port (  
            clk : in std_logic;
            Inst : in unsigned(15 downto 0); -- 16-bit Instruction from Instruction Memory
            Z : out unsigned(15 downto 0); -- 16- bit Output from ALU
            JumpOffset : out unsigned (7 downto 0);
            JumpFlag : out std_logic;
            BranchFlag : out std_logic;
            FoB : out std_logic;
            PC_Address : out unsigned(7 downto 0) );
end Inst_Execution_Block;

architecture Behavioral of Inst_Execution_Block is

component Decoder is
Port ( 
        Inst : in unsigned (15 downto 0);
        func : out std_logic_vector(3 downto 0);
        SR1 : out unsigned(2 downto 0); 
        SR2 : out unsigned(2 downto 0); 
        DR : out unsigned(2 downto 0); 
        IM : out unsigned(5 downto 0);
        MemAdd : out unsigned (7 downto 0);
        JumpOffset : out unsigned (7 downto 0);
        JumpFlag : out std_logic;
        FoB : out std_logic;
        PC_Address : out unsigned(7 downto 0);
        AddressFlag : out std_logic
        );
end component;

component Register_Memory is
port(
    clk : in std_logic;
    func : in STD_LOGIC_VECTOR(3 downto 0);
    AddressFlag : in std_logic;
    SR1 : in unsigned(2 downto 0); -- SR1 Address
    SR2 : in unsigned(2 downto 0); -- SR2 Address
    DR : in unsigned(2 downto 0); -- DR Address
    IM : in unsigned(15 downto 0); -- 16-bit Immediate Value
    DI : in unsigned(15 downto 0); -- Data In
    SR1_DO: out unsigned(15 downto 0); -- SR1 Data Out
    SR2_DO: out unsigned(15 downto 0); -- SR2 Data Out
    MEMREG : out unsigned(15 downto 0); -- Memory Address Register 
    AddressReg : out unsigned(15 downto 0)
    );
end component;

component Arithmetic_Logic_Unit is
    Port ( A : in unsigned (15 downto 0);
           B : in unsigned (15 downto 0);
           Function_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Function_Out : out unsigned (15 downto 0);
           Overflow_Out : out STD_LOGIC 
           );
end component;

component SetOnLessThan is
  Port (
        func : in std_logic_vector(3 downto 0);
        Borrow : in std_logic;
        DataOut : out unsigned(15 downto 0) 
         );
end component;

component ALU_STORE_MUX is
  Port (
        func : in std_logic_vector(3 downto 0);
        MemReg : in unsigned(15 downto 0);
        ALU_Out : in unsigned(15 downto 0);
        SetLessThan : in unsigned(15 downto 0);
        DataOut : out unsigned(15 downto 0));
end component;

component CheckForBranch is
  Port (
        func_bits : in std_logic_vector(3 downto 0);
        ALU_Result : in unsigned(15 downto 0);
        BranchFlag : out std_logic );
end component;

component Data_memory is
port(
    clk : in std_logic; -- clock signal
    func : in STD_LOGIC_VECTOR(3 downto 0); -- func select bits from instruction
    AddressFlag : in std_logic;
    Address : in unsigned(7 downto 0); -- Address
    AddressReg : in unsigned(15 downto 0);
    DI: in unsigned (15 downto 0); -- Data In
    DO: out unsigned(15 downto 0) -- Data Out
    );
end component;

component Sign_Extend is
    Port ( A : in unsigned(5 downto 0);
           Z : out unsigned(15 downto 0)
           );
end component;

signal overflow, Address_Flag : std_logic:= '0';
signal Func_bits : std_logic_vector(3 downto 0):= "0000";
signal SourceReg1_Address, SourceReg2_Address, DestReg_Address : unsigned(2 downto 0):= "000";
signal Immed_6_bits : unsigned (5 downto 0):= "000000";
signal Immed_16_bits, SR1_Data, SR2_Data, Address_Reg : unsigned (15 downto 0):= "0000000000000000";
signal Memory_Address : unsigned (7 downto 0):= "00000000";
signal Write_Data : unsigned (15 downto 0):= "0000000000000000";
signal ALU_Result : unsigned (15 downto 0):= "0000000000000000";
signal MemRegAdd : unsigned (15 downto 0) := "0000000000000000";
signal MuxOut : unsigned (15 downto 0) := "0000000000000000";
signal SetOnLess : unsigned (15 downto 0) := "0000000000000000";

begin

    DECODE: Decoder
    port map (
    Inst => Inst,
    func => Func_bits,
    SR1 => SourceReg1_Address,
    SR2 => SourceReg2_Address,
    DR => DestReg_Address,
    IM => Immed_6_bits,
    MemAdd => Memory_Address, 
    JumpOffset => JumpOffset,
    JumpFlag => JumpFlag,
    FoB => FoB,
    PC_Address => PC_Address,
    AddressFlag => Address_Flag );
    
    SIGN_EXT: Sign_Extend
    port map ( 
    A => Immed_6_bits,
    Z => Immed_16_bits );
        
    REGISTERS: Register_Memory
    port map(
    clk => clk,
    func => Func_bits,
    AddressFlag => Address_Flag,
    SR1 => SourceReg1_Address,
    SR2 => SourceReg2_Address,
    DR => DestReg_Address,
    IM => Immed_16_bits,
    DI => Write_Data,
    SR1_DO => SR1_Data,
    SR2_DO => SR2_Data,
    MEMREG => MemRegAdd,
    AddressReg => Address_Reg );
            
    ALU: Arithmetic_Logic_Unit
    port map ( 
    A => SR1_Data,
    B => SR2_Data,
    Function_Select => Func_bits,
    Function_Out => ALU_Result,
    Overflow_Out => overflow );
    
    SetLessThan : SetOnLessThan
    port map (
    func => Func_bits,
    Borrow => overflow,
    DataOut => SetOnLess );
    
    STORE_MUX: ALU_STORE_MUX
    port map (
    func => Func_bits,
    MemReg => MemRegAdd,
    SetLessThan => SetOnLess, 
    ALU_Out => ALU_Result,
    DataOut => MuxOut );
    
    Branch: CheckForBranch
    port map (
    func_bits => Func_bits,
    ALU_Result => ALU_Result,
    BranchFlag => BranchFlag );
    
    DATA_MEM: Data_Memory
    port map (
    clk => clk,
    func => Func_bits,
    AddressFlag => Address_Flag,
    AddressReg => Address_Reg,
    Address => Memory_Address,
    DI => MuxOut,
    DO => Write_Data );
    
    Z <= ALU_Result;
    
end Behavioral;
