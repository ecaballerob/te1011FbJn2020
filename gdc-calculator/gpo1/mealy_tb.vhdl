library ieee;
use ieee.std_logic_1164.all;

entity mealy_tb is
end entity;

architecture arch of mealy_tb is

    signal clk, tr, p : std_logic;
    constant clk_period : time := 10 ns;

    component mealy is
        port (
            clk, tr : in std_logic;
            p : out std_logic
        );
    end component;
    
begin
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    UUT : mealy port map ( clk, tr, p);
    tr <= '0';
end arch ; -- arch