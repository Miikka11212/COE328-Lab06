LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder4to16 IS
    PORT (
        A    : IN std_logic_vector(3 DOWNTO 0);  -- 4-bit input
        en   : IN std_logic;                     -- Enable signal
        Y    : OUT std_logic_vector(15 DOWNTO 0) -- 16 output lines
    );
END decoder4to16;

ARCHITECTURE behavior OF decoder4to16 IS
BEGIN
    PROCESS (A, en)
    BEGIN
        IF en = '1' THEN
            CASE A IS
                WHEN "0000" => Y <= "0000000000000001"; -- Activate Y0
                WHEN "0001" => Y <= "0000000000000010"; -- Activate Y1
                WHEN "0010" => Y <= "0000000000000100"; -- Activate Y2
                WHEN "0011" => Y <= "0000000000001000"; -- Activate Y3
                WHEN "0100" => Y <= "0000000000010000"; -- Activate Y4
                WHEN "0101" => Y <= "0000000000100000"; -- Activate Y5
                WHEN "0110" => Y <= "0000000001000000"; -- Activate Y6
                WHEN "0111" => Y <= "0000000010000000"; -- Activate Y7
                WHEN "1000" => Y <= "0000000100000000"; -- Activate Y8
                WHEN "1001" => Y <= "0000001000000000"; -- Activate Y9
                WHEN "1010" => Y <= "0000010000000000"; -- Activate Y10
                WHEN "1011" => Y <= "0000100000000000"; -- Activate Y11
                WHEN "1100" => Y <= "0001000000000000"; -- Activate Y12
                WHEN "1101" => Y <= "0010000000000000"; -- Activate Y13
                WHEN "1110" => Y <= "0100000000000000"; -- Activate Y14
                WHEN "1111" => Y <= "1000000000000000"; -- Activate Y15
                WHEN OTHERS => Y <= (OTHERS => '0');    -- Default to all outputs off
            END CASE;
        ELSE
            Y <= (OTHERS => '0'); -- All outputs off when enable is low
        END IF;
    END PROCESS;
END behavior;
