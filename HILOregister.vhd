library IEEE;
use IEEE.std_logic_1164.all;

entity hiloregister is
	port(mcand, HI, LO: inout STD_LOGIC_VECTOR(7 downto 0);
		testbit: out STD_LOGIC;
		shiftright, reset, add, load: in STD_LOGIC
	);
end entity;

architecture hilo of hiloregister is

component clock is
	port(value : out std_logic);
end component;

component adder is
	port (
                a,b: in STD_LOGIC_VECTOR (7 downto 0);
                adder_result: out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

signal HILO: STD_LOGIC_VECTOR(15 downto 0);
signal clockval: STD_LOGIC;

begin

C1: clock port map(value => clockval);

	hilodetermine: process(clockval) is
	begin
		if(clockval='1') then
			if(reset='1') then
				HILO <= "0000000000000000";
			elsif(load='1') then
				HILO(15 downto 8) <= HI;
				HILO(7 downto 0) <= LO;
			elsif(shiftright='1') then
				HILO(14 downto 0) <= HILO(15 downto 1);
				HILO(15) <= '1';
			end if;
		end if;
	
	HI <= HILO(15 downto 8);
	LO <= HILO(7 downto 0);
	testbit <= HILO(0);
	
	end process;
end architecture;
