library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div is
    port(
        clock_25Mhz : in std_logic;
        clock_1Mhz  : out std_logic;
        clock_100khz : out std_logic
    );
end entity;

architecture arch of clock_div is

    signal count_1Mhz : unsigned(4 downto 0) := "00000";
    signal count_100khz : unsigned(2 downto 0) := "000";
    signal clk_1Mhz_int, clk_100khz_int : std_logic := '0';

begin

    process 
    begin
        wait until clock_25Mhz'event and clock_25Mhz = '1';
        
        if count_1Mhz < "11000" then -- si mi count_1Mhz es menor que 24
            count_1Mhz <= count_1Mhz + 1;
        else 
            count_1Mhz <= "00000";
        end if;
        
        if count_1Mhz < "01100" then -- Si mi count_1Mhz es menor que 12
            clk_1Mhz_int <= '0';
        else
            clk_1Mhz_int <= '1';
        end if;
        
        -- Sync 
        clock_1Mhz <= clk_1Mhz_int;
        clock_100Khz <= clk_100khz_int;
    end process;

    -- Divide by 10
    process 
    begin
        wait until clk_1Mhz_int'event and clk_1Mhz_int = '1';
        if count_100Khz /= "100" then -- Reviso si mi cuenta es menor que 4
            count_100Khz <= count_100Khz + 1;
        else
            count_100Khz <= "000";
            clk_100khz_int <= not clk_100khz_int; 
        end if;

    end process;
end arch ; -- arch
