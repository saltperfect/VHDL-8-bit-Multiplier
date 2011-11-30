library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity adder is
        port (
                a,b: in STD_LOGIC_VECTOR (7 downto 0);
                adder_result: out STD_LOGIC_VECTOR (7 downto 0)
        );
end adder;

architecture behavioral of adder is
begin
   alu_process : process(a,b)

      variable op1 : integer;
      variable op2 : integer;
      variable res : integer;

function to_integer(X: STD_LOGIC_VECTOR) return INTEGER is
  variable result: INTEGER;
  begin
          result := 0;
          for i in X'range loop
                  result := result * 2;
                  case X(i) is
                          when '0' | 'L' => null;
                          when '1' | 'H' => result := result + 1;
                          when others => null;
                  end case;
          end loop;
          return result;
  end to_integer;

  begin
     op1 := to_integer(a(7 downto 0));
     op2 := to_integer(b(7 downto 0));	  
     res := op1 + op2;
     adder_result <= conv_std_logic_vector(res, 8);
  end process alu_process;
end behavioral;




