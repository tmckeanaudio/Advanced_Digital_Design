Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;

entity program_counter is
	port( 	
		clk : in std_logic;
		PC_in :in  std_logic_vector (7 downto 0);  
		Reset: in std_logic;
		PC_out1:  out std_logic_vector (7 downto 0);
		PC_out2: out std_logic_vector(7 downto 0));

end program_counter;

architecture counter of program_counter is

begin

process(clk, Reset)
variable pc : std_logic_vector (7 downto 0) := "00000000";
begin

if (clk'event and clk='1') then
 
    if (Reset = '1') then
		pc := (others => '0');--"00000000"; 
		
	else
    pc:= PC_in;
    PC_out1<= pc;
    PC_out2<= pc + "00000010";
    
    end if;
    end if;
end process;
end counter;
