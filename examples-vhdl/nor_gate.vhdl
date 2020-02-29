ENTITY nor_gate IS
    PORT (
        a, b    : IN BIT;
        x       : OUT BIT;
    );
END ENTITY nor_gate;

ARCHITECTURE arch OF nor_gate IS
BEGIN
    x <= a nor b;
END ARCHITECTURE arch;
