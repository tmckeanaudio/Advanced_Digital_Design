----------------------------------------------------------------------------------
-- Company: UMass Boston
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/07/2021 08:27:10 PM
-- Design Name: 
-- Module Name: PoV_Mux - Behavioral
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

entity PoV_Mux is
    Port ( MUX_MSD : in STD_LOGIC_VECTOR (3 downto 0);
           MUX_LSD : in STD_LOGIC_VECTOR (3 downto 0);
           MUX_cathode : in STD_LOGIC;
           MUX_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end PoV_Mux;

architecture Dataflow of PoV_Mux is

begin
    with MUX_cathode select MUX_OUT <=
    MUX_LSD when '0',
    MUX_MSD when others;

end Dataflow;
