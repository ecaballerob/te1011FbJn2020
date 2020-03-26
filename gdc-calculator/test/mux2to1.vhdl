LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS 
    PORT (
        x, y    : IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
        sel     : IN    BIT;
        res     : OUT   STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY mux;

ARCHITECTURE arch OF mux is
BEGIN
    WITH sel SELECT
        res <=  x WHEN '0',
                y WHEN '1';
END ARCHITECTURE arch;

        