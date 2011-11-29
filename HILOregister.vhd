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

	process hiloDetermine (clockval)
	begin
		if(clockval='1')
			if(reset='1')
				HILO <= "0000000000000000";
			end if;
			elsif(load='1')
				HILO(15 downto 8) <= HI;
				HILO(7 downto 0) <= LO;
			end if;
			elsif(shiftright='1')
				HILO(14 downto 0) <= HILO(15 downto 1);
				HILO(15) <= '1';
			end if;
			elsif(add='1')
				adder port map (a => mcand, b => HILO(15 downto 8), adder_result => HILO(15 downto 8));
			end if;
		end if;
	
	HI <= HILO(15 downto 8);
	LO <= HILO(7 downto 0);
	testbit <= HILO(0);
	
	end process;
end architecture;