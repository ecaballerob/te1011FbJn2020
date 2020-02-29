LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY heartbeat IS
    PORT( CLK: OUT STD_LOGIC);
END heartbeat;

ARCHITECTURE behaviour of heartbeat IS
    CONSTANT clk_period : TIME := 10 ns;
BEGIN
    CLK_PROCESS: PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;
END behaviour;
