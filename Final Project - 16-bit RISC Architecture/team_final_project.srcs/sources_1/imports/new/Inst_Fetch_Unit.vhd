Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;

entity Inst_Fetch is
	port ( clk : in std_logic;
		  Reset : in std_logic;
		  PC_in : in unsigned(7 downto 0);
		  pc_out2 : out unsigned(7 downto 0);
		  instruction : out unsigned (15 downto 0));
end Inst_Fetch; 

architecture Arc_Fetch of Inst_Fetch is 

signal PC_out1_s :  unsigned (7 downto 0);

  component program_counter is
		port( 	
		clk : in std_logic;
		PC_in : in unsigned (7 downto 0);  
		Reset: in std_logic;
		PC_out1:  out unsigned(7 downto 0);
		PC_out2: out unsigned(7 downto 0));
  end component  program_counter;

  component Inst_Mem is 
        port(
        address : in  unsigned(7 downto 0);---takes pc as input
		Inst_Set  : out unsigned(15 downto 0)); 
  end component Inst_Mem;

begin 
    P_C : program_counter 
    port map(
    clk=> clk,
    PC_in=> PC_in,
    Reset=>Reset,
    PC_out1=> PC_out1_s,
    PC_out2 => PC_out2
    );

    I_M : Inst_Mem 
    port map(
    address=> PC_out1_s,
    Inst_Set=> instruction
    );


end architecture Arc_Fetch ;