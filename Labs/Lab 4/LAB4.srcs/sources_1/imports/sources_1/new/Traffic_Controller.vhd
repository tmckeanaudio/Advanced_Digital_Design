----------------------------------------------------------------------------------
-- Company: UMass Boston 
-- Engineer: Tyler McKean
-- 
-- Create Date: 04/20/2021 05:40:28 AM
-- Design Name: 
-- Module Name: Traffic_Controller - Behavioral
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

entity Traffic_Controller is
    Port (
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           mode : in STD_LOGIC;
           en_cross : in STD_LOGIC;
           cross_out : out STD_LOGIC; 
           A : out STD_LOGIC_VECTOR(2 downto 0);
           B : out STD_LOGIC_VECTOR(2 downto 0);
           P : out STD_LOGIC_VECTOR(1 downto 0));
end Traffic_Controller;

architecture Behavioral of Traffic_Controller is

TYPE statetype is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
signal state : statetype; 
signal c : natural := 0; 
signal A_s, B_s : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal P_s : STD_LOGIC_VECTOR(1 downto 0) := "00"; 
signal en_cross_s, cross_out_s, flash: STD_LOGIC := '0';

begin
    FSM: process(clk,rst,mode,en_cross) 
    begin
    if rst = '1' then 
        state <= S0;
        c <= 0;
        cross_out_s <= '0';
    elsif mode = '1' and (clk ='1') then 
        if (flash = '0') then 
            state <= S6;
            flash <= not flash;
        else 
            state <= S7;
            flash <= not flash;
        end if;
        c <= 0; 
    elsif en_cross = '1' then 
        en_cross_s <= '1';  
        cross_out_s <= '1';
    elsif (clk' event) and (clk ='1') then 
        case state is 
            when S0 =>
                if c >= 3 then 
                    state <= S1;
                    c <= 0;
                 else 
                    state <= S0; 
                    c <= c + 1;
                 end if; 
             when S1 =>
                if c >= 1 then 
                    state <= S2;
                    c <= 0;
                 else 
                    state <= S1; 
                    c <= c + 1;
                 end if;
              when S2 =>
                if c >= 2 then 
                    state <= S3;
                    c <= 0;
                 else 
                    state <= S2; 
                    c <= c + 1;
                 end if;
              when S3 =>
                if c = 0 then
                    if en_cross_s = '1' then  
                        state <= S4;
                        en_cross_S <= '0';
                    else 
                        state <= S0;
                    end if;
                    c <= 0;
                 else 
                    state <= S3; 
                    c <= c + 1;
                 end if; 
              when S4 =>
                if c >= 1 then 
                    state <= S5;
                    c <= 0;
                 else 
                    state <= S4; 
                    c <= c + 1;
                 end if;
              when S5 =>
                if c >= 3 then 
                    state <= S0;
                    cross_out_s <= '0';
                    c <= 0;
                 else 
                    state <= S8; 
                    c <= c + 1;
                 end if; 
              when S6 => 
                state <= S0;
                c <= 0;
              when S7 => 
                state <= S0;
                c <= 0;
              when S8 =>
                if c >= 3 then 
                    state <= S0;
                    cross_out_s <= '0';
                    c <= 0;
                 else 
                    state <= S5; 
                    c <= c + 1;
                 end if;
           end case; 
        end if;
    end process; 

    Light_Outputs: process(state) 
    begin 
    case state is 
        when S0 => 
            A_s <= "100"; B_s <= "001"; P_s <= "01";                 
        when S1 => 
            A_s <= "010"; B_s <= "001"; P_s <= "01";                 
        when S2 => 
            A_s <= "001"; B_s <= "100"; P_s <= "01";                       
        when S3 => 
            A_s <= "001"; B_s <= "010"; P_s <= "01";                   
        when S4 => 
            A_s <= "001"; B_s <= "001"; P_s <= "10";                  
        when S5 => 
            A_s <= "001"; B_s <= "001"; P_s <= "01";                  
        when S6 => 
            A_s <= "111"; B_s <= "111"; P_s <= "11";                  
        when S7 => 
            A_s <= "000"; B_s <= "000"; P_s <= "00";                  
        when S8 => 
            A_s <= "001"; B_s <= "001"; P_s <= "00";                   
     end case;
    end process; 

cross_out <= cross_out_s;
A <= A_s;
B <= B_s; 
P <= P_s;

end Behavioral;
