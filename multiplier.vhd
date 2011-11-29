library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity multiplier is
	port ( mcand, mplier: in STD_LOGIC_VECTOR (7 downto 0);
	opCode, writeCode, shiftRight: in STD_LOGIC;
	hilo: in STD_LOGIC_VECTOR (15 downto 0)
	);
end entity;

architecture mult of multiplier is

component adder is
port (
                a,b: in STD_LOGIC_VECTOR (7 downto 0);
                adder_result: out STD_LOGIC_VECTOR (7 downto 0)
        );
end component;

component hiloregister is
port(mcand, HI, LO: inout STD_LOGIC_VECTOR(7 downto 0);
		testbit: out STD_LOGIC;
		shiftright, reset, load: in STD_LOGIC
	);
end component;

component control is
port( writeflag, shiftflag, addflag: out STD_LOGIC;
		clk, LO, reset: in STD_LOGIC
	);
end component;
ort(value : out std_logic);
component clock is

end component;

signal product: STD_LOGIC_VECTOR (15 downto 0);
signal writeflagsignal, shiftflagsignal, addflagsignal, clocksig, LSB, resetsignal, loadsignal: STD_LOGIC;
begin
	CLOCK: clock port map(value <= clocksig);
	M1: control port map (writeflag <= writeflagsignal, shiftflag <= shiftflagsignal, addflag <= addflagsignal, clk <= clocksig, LO <= LSB, reset <= resetsignal);
	M2: hiloregister port map(mcand <= mcand, HI <= mcand, LO <= mplier, testbit <= LSB, shiftright <= shiftrightsignal, reset <= resetsignal, load <= loadsignal);

process 
