LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder3to8 IS
    PORT (
        A : IN std_logic_vector(2 DOWNTO 0);  -- 3-bit input (A2, A1, A0)
        en : IN std_logic;                     -- Enable signal
        Y : OUT std_logic_vector(7 DOWNTO 0)   -- 8 output lines (Y7 to Y0)
    );
END decoder3to8;

ARCHITECTURE behavior OF decoder3to8 IS
BEGIN
    PROCESS (A, en)
    BEGIN
        IF en = '1' THEN
            CASE A IS
                WHEN "000" => Y <= "00000001";  -- Activate Y0
                WHEN "001" => Y <= "00000010";  -- Activate Y1
                WHEN "010" => Y <= "00000100";  -- Activate Y2
                WHEN "011" => Y <= "00001000";  -- Activate Y3
                WHEN "100" => Y <= "00010000";  -- Activate Y4
                WHEN "101" => Y <= "00100000";  -- Activate Y5
                WHEN "110" => Y <= "01000000";  -- Activate Y6
                WHEN "111" => Y <= "10000000";  -- Activate Y7
                WHEN OTHERS => Y <= "00000000"; -- Default case (all outputs off)
            END CASE;
        ELSE
            Y <= "00000000"; -- All outputs off if enable is low
        END IF;
    END PROCESS;
END behavior;
