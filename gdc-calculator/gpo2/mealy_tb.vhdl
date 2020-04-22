library ieee;
use ieee.std_logic_1164.all;

entity mealy_tb is
end entity;

architecture arch of mealy_tb is
    component mealy is
        port(
            timer, truck : in std_logic;
            pollution     : out std_logic
        );
    end component;
    signal timer, truck : std_logic;
    signal pollution : std_logic;
    constant period : time := 10 ns;

begin
    UUT : mealy port map (timer, truck, pollution);
    truck <= '0', '1' after 25 ns ;
    process
    begin
        timer <= '0';
        wait for period/2;
        timer <= '1';
        wait for period/2;
    end process;

end arch;