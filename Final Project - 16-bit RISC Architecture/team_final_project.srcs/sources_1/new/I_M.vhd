----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 08:27:08 PM
-- Design Name: 
-- Module Name: I_M - Behavioral
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Inst_Mem is
port(
address : in unsigned(7 downto 0); --takes pc as input
Inst_Set : out unsigned(15 downto 0)
);
end entity Inst_Mem;

architecture RTL of Inst_Mem is
type ROMtype is array (0 to 255) of unsigned(7 downto 0);
   
signal ROM : ROMtype;
begin
  ------PROGRAM #1------
ROM(0)<=  "01100001";
ROM(1)<=  "11000111"; -- Addi #7 to R0(Contained 0's) Now contains A
ROM(2)<=  "01100011";
ROM(3)<=  "11001000";-- Addi #8 to R1(Contains 0's) Now contained B
ROM(4)<=  "00000100";
ROM(5)<=  "00001000"; -- A+B save to R2
ROM(6)<=  "10010100";
ROM(7)<=  "00000000";-- store result in R2 to Data Mem 0x00
ROM(8)<=  "00110110";
ROM(9)<=  "00001000"; -- A or B save to R3
ROM(10)<= "10010110";
ROM(11)<= "00000100";-- store result in R3 to Mem 0x02
ROM(12)<= "00101000";
ROM(13)<= "00001000";-- A and B save to R4
ROM(14)<= "10011000";
ROM(15)<= "00001000";-- store result in R4 to Data Mem 0x04
ROM(16)<= "10001010";
ROM(17)<= "00000100";-- load value in Data Mem 0x02 to R5
ROM(18)<= "10001100";
ROM(19)<= "00001000"; -- load value in Data Mem 0x04 to R6
ROM(20)<= "00011111";
ROM(21)<= "01110000";-- Subtract R5 to R6 and saves it into R7
ROM(22)<= "10011110";
ROM(23)<= "00001100";-- store result in R7 to Data Mem 0x06
--------CLEAR REGISTERS----------------------------
ROM(24)<= "01110000";
ROM(25)<= "00000000";----Andi #0 to R0 (Contained #7) put value back into R0(Reset R0)
ROM(26)<= "01110010";
ROM(27)<= "01000000";----Andi #0 to R1  put value back into R1(Reset R1)
ROM(28)<= "01110100";
ROM(29)<= "10000000";----Andi #0 to R2  put value back into R2(Reset R2)
ROM(30)<= "01110110";
ROM(31)<= "11000000";----Andi #0 to R3  put value back into R3(Reset R3)
ROM(32)<= "01111001";
ROM(33)<= "00000000";----Andi #0 to R4  put value back into R4(Reset R4)
ROM(34)<= "01111011";
ROM(35)<= "01000000";----Andi #0 to R5  put value back into R5(Reset R5)
ROM(36)<= "01111101";
ROM(37)<= "10000000";----Andi #0 to R6  put value back into R6(Reset R6)
ROM(38)<= "01111111";
ROM(39)<= "11000000";----Andi #0 to R7  put value back into R7(Reset R7)
ROM(40)<= "10010000";
ROM(41)<= "00000000";
------PROGRAM 2-----------
ROM(42)<= "01100001";
ROM(43)<= "01001010";-----Addi #10 to R0(Contained 0's), store value back into (R0), Now contains the value of 10 for int range=10
ROM(44)<= "01100011";
ROM(45)<= "01000010";----Addi #2 to R1(Contained 0's), store value back into (R1), Now contains the value of 2 for i=2
ROM(46)<= "01100101";
ROM(47)<= "01000001";----Addi #1 to R2(Contained 0's), store value back into (R2), Now contains the value of 1 for index increment
ROM(48)<= "01100111";
ROM(49)<= "01000010";----Addi #2 to R3(Contained 0's), store value back into (R3), Now contains the value of 2 for address increment
--ROM(42)<= "01101001";
--ROM(43)<= "00001000"; -- Addi 0x08 to R4, should be last address (Data Mem 0x08 in our case)
--ROM(42)<= "00001111";
--ROM(43)<= "01110000";---- Add R5 to R6 and store value in R7 (Contains Fib[i])
ROM(50)<= "01101101";
ROM(51)<= "01000001";---- Addi #1 to R6(Contained 0's), store value back into (R6)
ROM(52)<= "00001001";
ROM(53)<= "00011000";---- Add R4 to R3 (Updating our address) put it back into R4
ROM(54)<= "10011101";
ROM(55)<= "00000001";-----Store R6 to the memory address in R4
ROM(56)<= "00001001";
ROM(57)<= "00011000";---- Add R4 to R3 (Updating our address) put it back into R4
ROM(58)<= "00001111";
ROM(59)<= "01110000";---- Add R5 to R6 and store value in R7 (Contains Fib[i])
ROM(60)<= "10011111";  
ROM(61)<= "00000001";--------   Store R7 to the memory address in R4
ROM(62)<= "00001001";
ROM(63)<= "00011000";---- Add R4 to R3 (Updating our address) put it back into R4 
ROM(64)<= "01101011";
ROM(65)<= "10000000";----Addi #0 to R6 Store in R5
ROM(66)<= "01101101";
ROM(67)<= "11000000";----Addi #0 to R7 and save s into R6
ROM(68)<= "00000010";
ROM(69)<= "10010000";---- Add R1 to R2, stores back into R1 (Increment the index)
ROM(70)<= "11000001";
ROM(71)<= "01001000"; ----Branch( Compare R1(Indexing) to R0(#10)
ROM(72)<= "10100000";
ROM(73)<= "01111100";---- Jump
ROM(74)<= "00001001";
ROM(75)<= "00011000";---- Add R4 to R3 (Updating our address) put it back into R4

--Address input is used to access data in ROM
Inst_Set(15 downto 8) <= ROM(to_integer(address));
Inst_Set(7 downto 0) <= ROM(to_integer(address)+1);

end architecture RTL;