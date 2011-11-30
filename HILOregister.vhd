library IEEE;
use IEEE.std_logic_1164.all;

entity hiloregister is
	port(mcand, HI, LO: in STD_LOGIC_VECTOR(7 downto 0);
		testbit: out STD_LOGIC;
		shiftright, reset, load, add, clockval: in STD_LOGIC;
		result: out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture hilo of hiloregister is

component adder is
	port (
                a,b: in STD_LOGIC_VECTOR (7 downto 0);
                adder_result: out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

signal HILO: STD_LOGIC_VECTOR(15 downto 0);
signal HIadded: STD_LOGIC_VECTOR(7 downto 0);

begin

A1: adder port map(a => HI, b => mcand, adder_result => HIadded);

	process(clockval) is
	begin
		if(clockval='1') then
			if(reset='1') then
				HILO <= "0000000000000000";
			elsif(load='1') then
				HILO(15 downto 8) <= HI;
				HILO(7 downto 0) <= LO;
			elsif(shiftright='1') then
				if(add='1') then
					HILO(15 downto 8) <= HIadded;
				end if;
				HILO(14 downto 0) <= HILO(15 downto 1);
				HILO(15) <= '1';
			end if;
		end if;
	
	result(15 downto 8) <= HILO(15 downto 8);
	result(7 downto 0) <= HILO(7 downto 0);
	testbit <= HILO(0);
	
	end process;
end architecture;


