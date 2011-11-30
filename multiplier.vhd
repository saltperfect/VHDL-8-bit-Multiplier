library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity multiplier is
	port ( mcand, mplier: in STD_LOGIC_VECTOR (7 downto 0);
	reset: in STD_LOGIC;
	product: out STD_LOGIC_VECTOR (15 downto 0)
	);
end entity;

architecture mult of multiplier is

component hiloregister is
port(mcand, HI, LO, addedHI: in STD_LOGIC_VECTOR(7 downto 0);
		testbit: out STD_LOGIC;
		shiftright, reset, load, add, clockval: in STD_LOGIC;
		result: out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

component control is
port( writeflag, shiftflag, addflag, loadflag: out STD_LOGIC;
		clk, LO, reset: in STD_LOGIC
	);
end component;

component clock is
	 port(value : out std_logic);
end component;

component adder is
        port (
                a,b: in STD_LOGIC_VECTOR (7 downto 0);
                adder_result: out STD_LOGIC_VECTOR (7 downto 0)
        );
end component;

signal productval: STD_LOGIC_VECTOR (15 downto 0);
signal productHI: STD_LOGIC_VECTOR (7 downto 0) := mcand;
signal addHIsignal: STD_LOGIC_VECTOR (7 downto 0):= mcand;
signal writeflagsignal, shiftflagsignal, addflagsignal, clocksig, startsig, LSB, resetsignal, loadsignal: STD_LOGIC;
begin
	startsig <= '1' after 40 ns;
	resetsignal <= reset;
	productHI <= productval(15 downto 8);
	LSB <= productval(0);
	CLOCK1: clock port map(value => clocksig);
	ADD1: adder port map(a => productHI, b => mcand, adder_result => addHIsignal);
	M1: control port map (writeflag => writeflagsignal, shiftflag => shiftflagsignal, addflag => addflagsignal, loadflag => loadsignal, LO => LSB, reset => resetsignal, clk => clocksig);
	M2: hiloregister port map(mcand => mcand, HI => mcand, LO => mplier, addedHI => addHIsignal, testbit => LSB, shiftright => shiftflagsignal, add => addflagsignal, clockval => clocksig, reset => resetsignal, load => loadsignal, result => productval);
	product <= productval(15 downto 0);

end architecture;







