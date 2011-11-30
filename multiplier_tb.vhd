library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity multiplication_tester is
	port ( mcandtest, mpliertest: in STD_LOGIC_VECTOR (7 downto 0);
	producttest: out STD_LOGIC_VECTOR (15 downto 0)
	);
end entity;

architecture behavioral of multiplication_tester is

component multiplier is
port ( mcand, mplier: in STD_LOGIC_VECTOR (7 downto 0);
	reset: in STD_LOGIC;
	product: out STD_LOGIC_VECTOR (15 downto 0)
	);
end component;

Signal myproduct: std_logic_vector(15 downto 0);
Signal mymcandtest, mympliertest, mytrueproduct: std_logic_vector(7 downto 0);
Signal resetsig: std_logic;
begin

C1: multiplier port map (mcand => mymcandtest, mplier => mympliertest, product => myproduct, reset => resetsig);
mymcandtest <= "00000000" after 0 ns, "00000001" after 1205 ns, "00000011" after 2405 ns, "00000001" after 3605 ns, "00000101" after 4805 ns;
mympliertest <= "00000001" after 0 ns, "00000010" after 1205 ns, "00000011" after 2405 ns, "00000000" after 3605 ns, "00000010" after 4805 ns;
mytrueproduct <= myproduct(7 downto 0);
resetsig <= '0' after 0 ns, '1' after 1200 ns, '0' after 1205 ns, '1' after 2400 ns, '0' after 2405 ns, '1' after 3600 ns, '0' after 3605 ns, '1' after 4800 ns, '0' after 4805 ns;

end behavioral;







