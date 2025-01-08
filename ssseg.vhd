LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY ssseg IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
n : IN STD_LOGIC;
leds : OUT STD_LOGIC_VECTOR(1 TO 7);
neg : OUT STD_LOGIC_VECTOR(1 TO 7)) ;
END ssseg;

ARCHITECTURE Behavior OF ssseg IS
BEGIN
	PROCESS (bcd)
		BEGIN	
		if (n = '1') THEN
			neg <= "0000001";
		END if;
			CASE bcd IS
				WHEN "0000" => leds <= "0000001";
				WHEN "0001" => leds <= "1001111";
				WHEN "0010" => leds <= "0010010";
				WHEN "0011" => leds <= "0000110";
				WHEN "0100" => leds <= "1001100";
				WHEN "0101" => leds <= "0100100";
				WHEN "0110" => leds <= "0100000";
				WHEN "0111" => leds <= "0001111";
				WHEN "1000" => leds <= "0000000";
				WHEN "1001" => leds <= "1111011";
				WHEN "1010" => leds <= "0100000";
				WHEN "1011" => leds <= "0100100";
				WHEN "1100" => leds <= "1001100";
				WHEN "1101" => leds <= "0000110";
				WHEN "1110" => leds <= "0010010";
				WHEN "1111" => leds <= "1001111";
				WHEN OTHERS => leds <= "1111111";
			END CASE;
	END PROCESS;
END Behavior;
		