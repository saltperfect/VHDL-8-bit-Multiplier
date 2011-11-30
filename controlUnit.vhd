library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity control is
	port( writeflag, shiftflag, addflag, loadflag: out STD_LOGIC;
		clk, LO, reset: in STD_LOGIC
	);
end entity;

architecture behavioral of control is

type statetype is (Load, Shift, Continue, EndS);
signal state: statetype;
signal repetitions: INTEGER:= 0;
signal leastBit: STD_LOGIC:= LO;

begin

	process
	variable next_state : statetype := Load;
	
	begin
		leastBit <= LO;
		wait until (clk'event and clk='1');
		if reset = '1' then
			state <= statetype'left;
		else
			case state is
			when Load =>
				loadflag <= '1';
				shiftflag <= '0';
				addflag <= '0';
				next_state := Continue;
			when Continue =>
			if leastBit='0' or leastBit='U' then
				next_state := Shift;
				loadflag <= '0';
				shiftflag <= '0';
				addflag <= '0';
			else
				next_state := Shift;
				loadflag <= '0';
				shiftflag <= '0';
				addflag <= '1';				
			end if;
			when Shift =>
				next_state := Continue;
				loadflag <= '0';
				shiftflag <= '1';
				addflag <= '0';
			when Ends =>
				loadflag <= '0';
				shiftflag <= '0';
				addflag <= '0';
				null;
			end case;
			repetitions <= repetitions + 1;
			if(repetitions = 10) then
				next_state := EndS;
			end if;
			state <= next_state;
		end if;
	end process; 
end behavioral;





