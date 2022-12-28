library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toggler is
	port(
		clk : in  std_logic;
		rst : in  std_logic;
		A   : in  std_logic;
		Z   : out std_logic
	);
end entity toggler;

architecture Behavioral of toggler is
	signal Zi, onecount, twocount : std_logic;
begin
	process(clk, rst) is
	begin
		if rst = '1' then
			Zi       <= '0';
			onecount <= '0';
			twocount <= '0';

		elsif clk = '1' and clk'event then
			if A = '1' then
				if onecount = '0' then
					onecount <= '1';
				elsif onecount = '1' then
					twocount <= '1';
				end if;
			elsif A = '0' then
				if twocount = '1' then
					Zi <= not Zi;
				end if;

				onecount <= '0';
				twocount <= '0';
			end if;
		end if;
	end process;
	Z <= Zi;
end architecture Behavioral;