library ieee;
use ieee.std_logic_1164.all;

entity clk_bcd_tb is
end entity;

architecture arch of clk_bcd_tb is

    component clk_bcd is
        port(
            clk_in : in std_logic;
            count : out std_logic_vector(3 downto 0);
            clk_out  : out std_logic
        );
    end component;

    signal clkin, clkout : std_logic;
    signal counter : std_logic_vector(3 downto 0);
    signal period : time := 40 ns;
begin
    UUT : clk_bcd port map (clkin, counter, clkout);

    process 
    begin
        clkin <= '0';
        wait for period / 2;
        clkin <= '1';
        wait for period / 2;
        
    end process;

end arch ; -- arch