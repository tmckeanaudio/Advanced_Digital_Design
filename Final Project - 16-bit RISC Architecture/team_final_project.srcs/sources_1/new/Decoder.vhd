----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 05/01/2021 07:46:21 PM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
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
end Decoder;

architecture Behavioral of Decoder is

signal Branch : std_logic_vector (1 downto 0);
signal zeros : std_logic_vector (1 downto 0) := "00";

begin
    Decode: process(Inst)
    begin
        if Inst(15 downto 12) = "0000" then -- ADD Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "0001" then -- SUBTRACT Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "0010" then -- AND Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            IM <= "------";
            MemAdd <= "--------"; 
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';  
        elsif Inst(15 downto 12) = "0011" then -- OR Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0'; 
        elsif Inst(15 downto 12) = "0100" then -- SHIFT LEFT Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "0101" then -- SHIFT RIGHT Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "0110" then -- ADD Immediate Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= "---";
            IM <= Inst(5 downto 0);
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "0111" then -- AND Immediate Operation
            func <= std_logic_vector(Inst(15 downto 12));
            DR <= Inst(11 downto 9);
            SR1 <= Inst(8 downto 6);
            SR2 <= "---";
            IM <= Inst(5 downto 0);
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "1000" then -- LOAD Operation
            func <= std_logic_vector(Inst(15 downto 12));
            SR1 <= "---";
            SR2 <= "---";
            DR <= Inst(11 downto 9);
            IM <= "------";
            MemAdd <= Inst(8 downto 1);
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
         elsif Inst(15 downto 12) = "1001" AND Inst(0) = '1' then -- STORE Operation
            func <= std_logic_vector(Inst(15 downto 12));
            SR1 <= Inst(8 downto 6);
            SR2 <= "---";
            DR <= Inst(11 downto 9);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= std_logic(Inst(0));    
        elsif Inst(15 downto 12) = "1001" then -- STORE Operation
            func <= std_logic_vector(Inst(15 downto 12));
            SR1 <= "---";
            SR2 <= "---";
            DR <= Inst(11 downto 9);
            IM <= "------";
            MemAdd <= Inst(8 downto 1);
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= std_logic(Inst(0));
        elsif Inst(15 downto 12) = "1010"  then -- JUMP Operation
            func <= std_logic_vector(Inst(15 downto 12));
            SR1 <= "---";
            SR2 <= "---";
            DR <= "---";
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= Inst(11 downto 4);
            JumpFlag <= std_logic(Inst(3));
            FoB <= std_logic(Inst(2));
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 12) = "1011" then -- SET ON LESS THAN Operation
            func <= std_logic_vector(Inst(15 downto 12));
            SR1 <= Inst(8 downto 6);
            SR2 <= Inst(5 downto 3);
            DR <= Inst(11 downto 9);
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= "--------";
            AddressFlag <= '0';
        elsif Inst(15 downto 14) = "11" then -- BRANCH ON EQUAL Operation
            func <= std_logic_vector(Inst(15 downto 14) & "00");
            SR1 <= Inst(13 downto 11);
            SR2 <= Inst(10 downto 8);
            DR <= "---";
            IM <= "------";
            MemAdd <= "--------";
            JumpOffset <= "--------";
            JumpFlag <= '0';
            FoB <= '-';
            PC_Address <= Inst(7 downto 0);
            AddressFlag <= '0';
        end if;
        end process;

        
end Behavioral;
