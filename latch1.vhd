library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity latch1 is
	port ( A : in std_logic_vector (7 downto 0);
				res, clock : in std_logic;
				Q : out std_logic_vector(7 downto 0));
end latch1;

architecture beh of latch1 is
begin
	process(res, clock)
	begin	if res = '1' then	
				Q <= "00000000";
			elsif clock'Event and clock ='1' then
				Q <= A;
		end if;
	end process;
end beh;