library IEEE;
use IEEE.std_logic_1164.all;

entity hiloregister is
	port(mcand, HI, LO, addedHI: in STD_LOGIC_VECTOR(7 downto 0);
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

begin

A0:testbit <= HILO(0);
A1:
	process(clockval) is
	begin
		if(clockval='1') then
			if(reset='1') then
				HILO <= "0000000000000000";
			end if;
			if(load='1') then
				HILO(15 downto 8) <= HI;
				HILO(7 downto 0) <= LO;
			end if;
			if(add='1') then
				HILO(15 downto 8) <= addedHI;
			end if;
			if(shiftright='1') then
				HILO(14 downto 0) <= HILO(15 downto 1);
				HILO(15) <= '1';
			end if;
		end if;
	
	result(15 downto 8) <= HILO(15 downto 8);
	result(7 downto 0) <= HILO(7 downto 0);
	testbit <= HILO(0);
	
	end process;
end architecture;



