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
mymcandtest <= "00000101";
mympliertest <= "00001010";
mytrueproduct <= myproduct(7 downto 0);
resetsig <='0' after 0 ns, '1' after 190 ns, '0' after 200 ns;

end behavioral;









