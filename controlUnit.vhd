library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity control is
	port( writeflag, shiftflag, addflag: out STD_LOGIC;
		clk, LO, reset: in STD_LOGIC
	);
end entity;

architecture behavioral of control is

type statetype is (Load, Shift);
signal state: statetype;
signal repetitions: INTEGER:= 0;
signal leastBit: STD_LOGIC:= LO;

begin

	process
	variable next_state : statetype := Load;
	
	begin
		wait until (clk'event and clk='1');
		if reset = '1' then
			state <= statetype'left;
		else
			case state is
			when Load =>
			if leastBit='0' then
				next_state := Shift;
				shiftflag <= '1';
			else
				next_state := Shift;
				addflag <= '1';
				shiftflag <= '1';				
			end if;
			when Shift =>
				next_state := Load;
				shiftflag <= '0';
				addflag <= '0';
			end case;
			state <= next_state;
			repetitions <= repetitions + 1;
		end if;
	end process; 
end behavioral;
