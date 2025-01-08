library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
port (clk, res : in std_logic;
		A, B 	: in std_logic_vector(7 downto 0);
		OP	 	: in unsigned(7 downto 0);
		neg 	: out std_logic;
		result	:	out std_logic_vector(7 downto 0)
		);
end ALU;

architecture calc of ALU is
begin
process (clk, res)
	begin

	if res = '1' then
		result <= "00000000";
	elsif (clk'EVENT AND clk='1') then
		case OP is
			when "00000001" => result <= std_logic_vector(unsigned(A) + unsigned(B));
			when "00000010" => result <= std_logic_vector(unsigned(A) - unsigned(B));
			when "00000100" => result <= NOT A;
			when "00001000" => result <= NOT A OR NOT B;
			when "00010000" => result <= NOT A AND NOT B;
			when "00100000" => result <= A AND B;
			when "01000000" => result <= A XOR B;
			when "10000000" =>	result <= A OR B;

			when others => result <= "00000000";
		end case;
end if;
end process;

end calc;