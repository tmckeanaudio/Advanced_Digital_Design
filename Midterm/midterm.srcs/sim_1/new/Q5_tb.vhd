library ieee;
use ieee.std_logic_1164.all;

entity Q5_tb is
end entity Q5_tb;

architecture Q5_tb_stimulus of Q5_tb is 

component Q5_design is
        port( 
              a,b,c : in std_logic;
              x,y,z : out std_logic
            );
end component;

signal a_s, b_s, c_s : std_logic := '0';
signal x_s, y_s, z_s : std_logic := '0';

begin
    UUT: Q5_design
    port map(
        a => a_s,
        b => b_s,
        c => c_s,
        x => x_s,
        y => y_s,
        z => z_s
        );
        
    a_s <= not a_s after 40ns;
    b_s <= not b_s after 20ns;
    c_s <= not c_s after 10ns;
        
end Q5_tb_stimulus; 