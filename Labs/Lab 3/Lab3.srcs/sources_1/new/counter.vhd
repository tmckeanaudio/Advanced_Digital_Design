library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity counter is
	port(
		rst      : in  STD_LOGIC;
		clk      : in  STD_LOGIC;
		ld       : in  STD_LOGIC;
		en       : in  STD_LOGIC;
		up_dn    : in  STD_LOGIC;
		D        : in  STD_LOGIC_VECTOR(3 downto 0);
		overflow : out STD_LOGIC;
		Q        : out STD_LOGIC_VECTOR(3 downto 0)
	);
end counter;

architecture Behavioral of counter is
	signal Qi : std_logic_vector(3 downto 0);

begin
	Q_proc : process(clk, rst) is
	begin
		if rst = '1' then
			Qi <= "0000";

		elsif clk = '1' and clk'event then
			if ld = '1' then
				if (unsigned(D) >= 0) and (unsigned(D) <= 9) then
					Qi <= D;
				else
					Qi <= "0000";
				end if;
			elsif en = '1' then
				if up_dn = '0' then
					if Qi = "0000" then
						Qi <= "1001";
					else
						Qi <= std_logic_vector(unsigned(Qi) - 1);
					end if;
				elsif up_dn = '1' then
					if Qi = "1001" then
						Qi <= "0000";
					else
						Qi <= std_logic_vector(unsigned(Qi) + 1);
					end if;
				end if;
			end if;
		end if;

	end process Q_proc;

	Q <= Qi;

	overflow_proc : process(Qi, en, up_dn) is
	begin
		if en = '1' then
			if Qi = "0000" and up_dn = '0' then
				overflow <= '1';
			elsif Qi = "1001" and up_dn = '1' then
				overflow <= '1';
			else
				overflow <= '0';
			end if;
		else
			overflow <= '0';
		end if;
	end process overflow_proc;

end Behavioral;