library ieee;
use ieee.std_logic_1164.all;

entity Q5_design is
        port( 
                a,b,c : in std_logic;
                x,y,z : out std_logic
            );
end entity Q5_design;

architecture schem of Q5_design is 
signal s1, s2, s3 : std_logic;

begin
        s1 <= a or (b and c);
        x <= s1;
        s2 <= a xor b;
        y <= s2;
        s3 <= a and b and c;
        z <= not s3;
        
end architecture schem;                            