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
	LSBtest,addtest,clocktest: out STD_LOGIC;
	repetitiontester: out INTEGER;
	product: out STD_LOGIC_VECTOR (15 downto 0)
	);
end component;

Signal myproduct: std_logic_vector(15 downto 0);
Signal mymcandtest, mympliertest, mytrueprodcut: std_logic_vector(7 downto 0);
Signal myLSBtest, myaddtest, myclocktest: std_logic;
signal reptest : INTEGER;
begin

C1: multiplier port map (mcand => mymcandtest, mplier => mympliertest, product => myproduct, reset => '0', LSBtest => myLSBtest, addtest => myaddtest, clocktest => myclocktest, repetitiontester => reptest);
mymcandtest <= "00000101";
mympliertest <= "00001010";
mytrueprodcut <= myproduct(7 downto 0);

end behavioral;







