library ieee;
use ieee.std_logic_1164.all;

entity moore_tb is
end entity;

architecture arch of moore_tb is

    signal clk : std_logic;
    signal sem : std_logic_vector(1 downto 0);

    constant clk_period : time := 10 ns;

    component moore is
        port (
            clk : in std_logic;
            sem : out std_logic_vector(1 downto 0)
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
    
    UUT : moore port map ( clk, sem);

end arch ; -- arch