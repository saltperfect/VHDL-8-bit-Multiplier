library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity multiplication_tester is
	port ( mcandtest, mpliertest: in STD_LOGIC_VECTOR (7 downto 0);
	producttest: STD_LOGIC_VECTOR (7 downto 0)
	);
end entity;

architecture behavioral of multiplication_tester is

component multiplier is
port ( mcand, mplier: in STD_LOGIC_VECTOR (7 downto 0);
	reset: in STD_LOGIC;
	product: STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

Signal mymcandtest, mympliertest: std_logic_vector(7 downto 0);
begin

mymcandtest <= mcandtest;
mympliertest <= mpliertest;
C1: multiplier port map (mcand => mcandtest, mplier => mpliertest, product => producttest, reset => '0');
mymcandtest <= "00000010" after 10 ns, "00000001" after 30 ns, "00000100" after 50 ns;
mympliertest <= "00010000" after 10 ns, "00000111" after 30 ns, "00010010" after 50 ns;

end behavioral;


