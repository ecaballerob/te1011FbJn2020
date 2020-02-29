LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY nand_example IS
    PORT(
            A, B    : IN    STD_LOGIC;
            X       : OUT   STD_LOGIC
        );
END ENTITY;

ARCHITECTURE arch OF nand_example IS
BEGIN
    X <= A NAND B;

END arch;
