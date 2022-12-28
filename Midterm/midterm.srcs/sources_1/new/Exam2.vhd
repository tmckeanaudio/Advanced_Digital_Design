----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2021 12:38:23 AM
-- Design Name: 
-- Module Name: Exam2 - Behavioral
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

entity Exam2 is
    Port ( M : in std_logic_vector (2 downto 0);
           N : out std_logic_vector (1 downto 0));
end Exam2;

architecture mixed of Exam2 is

component Q5_design is 
    port( 
            a,b,c : in std_logic;
            x,y,z : out std_logic
         );
end component;

signal x0,y0,z0,c1,x1,y1,z1 : std_logic;

begin

    exam_0: Q5_design port map(
        a => M(0),
        b => M(1),
        c => M(2),
        x => x0,
        y => y0,
        z => z0 );
        
    exam_1: Q5_design port map(
        a => z0,
        b => M(1),
        c => c1,
        x => x1,
        y => y1,
        z => z1 );
      
    and_1: N(0) <= x0 and y0;
    and_2: N(1) <= x1 and y1;
    and_3: c1 <= M(2) and z1;

end mixed;
