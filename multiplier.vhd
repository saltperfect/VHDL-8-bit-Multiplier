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

component alu32 is
end component;

component hiloregister is
end component;

component control is
end component;

signal product: STD_LOGIC_VECTOR (15 downto 0);

begin

process 