library IEEE;
use IEEE.std_logic_1164.all;

entity clock is 
 port(value : out std_logic);
end clock;

architecture structural of clock is

signal clock_value : std_logic := '0';
begin
	Set: value <= clock_value;
	clock_process: Process(clock_value) is
		       begin
				clock_value <= not clock_value after 10 ns;
			end Process clock_process;
end structural;
