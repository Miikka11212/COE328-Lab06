library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity SECOND_ALU is
port (clk, res : in std_logic;
		A, B 	: in std_logic_vector(7 downto 0);
		OP	 	: in unsigned(15 downto 0);
		neg 	: out std_logic;
		result1, result2	:	out std_logic_vector(3 downto 0)
		);
end SECOND_ALU;

architecture calc of SECOND_ALU is
	signal temp_result : std_logic_vector(7 downto 0);
begin
process (clk, res)
	begin

	if res = '1' then
		temp_result <= (others => '0');
	elsif (clk'EVENT AND clk='1') then
		case OP is
			when "0000000000000001" => temp_result <= std_logic_vector(unsigned(B) - 9);
			when "0000000000000010" => temp_result <= B(3 downto 0) & B(7 downto 4);
			when "0000000000000100" => temp_result <= A(5 downto 0) & "00";
			when "0000000000001000" => temp_result <= NOT (A AND B);
			when "0000000000010000" => 
				if unsigned(A) > unsigned(B) THEN
					temp_result <= A;
				else
					temp_result <= B;
				end if;
			
			when "0000000000100000" => temp_result <= not B(0) & B(1) & not B(2) & B(3) & not B(4) & B(5) & not B(6) & B(7);
			when "0000000001000000" => temp_result <= (OTHERS => '0');
			when "0000000010000000" =>	temp_result <= A(7 downto 4) & B(3 downto 0);

			when others => temp_result <= "00000000";
		end case;
end if;
end process;
	result1 <= temp_result(7 downto 4);
	result2 <= temp_result(3 downto 0);
	neg <= temp_result(7);

end calc;