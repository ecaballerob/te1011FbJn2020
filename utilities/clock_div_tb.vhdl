library ieee;
use ieee.std_logic_1164.all;

entity clock_div_tb is
end entity;

architecture arch of clock_div_tb is

    component clock_div is
        port(
            clock_25Mhz : in std_logic;
            clock_1Mhz  : out std_logic;
            clock_100khz  : out std_logic
        );
    end component;

    signal clk25, clk1, clk100k : std_logic;
    signal period : time := 40 ns;
begin
    UUT : clock_div port map (clk25, clk1, clk100k);

    process 
    begin
        clk25 <= '0';
        wait for period / 2;
        clk25 <= '1';
        wait for period / 2;
        
    end process;

end arch ; -- arch