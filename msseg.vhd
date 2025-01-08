LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY msseg IS
    PORT (
        clk         : IN std_logic;                          -- Clock signal
        res         : IN std_logic;                          -- Reset signal
        student_id  : IN std_logic_vector(3 DOWNTO 0);       -- 4-bit student ID
        B           : IN std_logic_vector(7 DOWNTO 0);       -- 8-bit input B (2 BCD digits)
        display     : OUT std_logic_vector(1 TO 7)           -- 7-segment display output
    );
END msseg;

ARCHITECTURE behavior OF msseg IS
    SIGNAL upper_digit, lower_digit : std_logic_vector(3 DOWNTO 0);
    SIGNAL match : std_logic;
BEGIN
    -- Split B into upper and lower 4-bit digits
    upper_digit <= B(7 DOWNTO 4); -- Upper 4 bits of B
    lower_digit <= B(3 DOWNTO 0); -- Lower 4 bits of B

    -- Check if either digit matches the student ID
    PROCESS (upper_digit, lower_digit, student_id)
    BEGIN
        IF (upper_digit = student_id) OR (lower_digit = student_id) THEN
            match <= '1';
        ELSE
            match <= '0';
        END IF;
    END PROCESS;

    -- Set the display based on the match signal
    PROCESS (clk, res)
    BEGIN
        IF res = '1' THEN
            display <= "0000000"; -- Reset display
        ELSIF rising_edge(clk) THEN
            IF match = '1' THEN
                display <= "0111011"; -- Display 'y' on 7-segment
            ELSE
                display <= "0010101"; -- Display 'n' on 7-segment
            END IF;
        END IF;
    END PROCESS;
END behavior;