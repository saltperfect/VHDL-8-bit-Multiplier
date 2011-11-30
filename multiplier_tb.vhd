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

Signal mymcandtest, mympliertest: std_logic_vector(7 downto 0);
begin

C1: multiplier port map (mcand => mymcandtest, mplier => mympliertest, product => producttest, reset => '0');
mymcandtest <= "00000011" after 0 ns;
mympliertest <= "00000000" after 0 ns;

end behavioral;




