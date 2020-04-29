library ieee;
use ieee.std_logic_1164.all;

entity shift_register_tb is
end entity;


architecture arch of shift_register_tb is
    
    component shift_register is
        port (
            clr, clk, sdr, sdl : in std_logic;
            mode : in std_logic_vector(1 downto 0);
            parallel : in std_logic_vector(3 downto 0);
            q : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clr, clk, sdr, sdl : std_logic;
    signal mode : std_logic_vector(1 downto 0);
    signal parallel, q : std_logic_vector(3 downto 0);

    constant period : time := 10 ns;

begin

    UTT : shift_register port map (clr, clk, sdr, sdl, mode, parallel, q);

    clk_process : process
    begin
        clk <= '0';
        wait for period/2;
        clk <= '1';
        wait for period/2;
    end process;

    clr <= '0', '1' after period*4, '0' after period*20;
    mode <= "00", "11" after period*5, "10" after period*6, "01" after period*12, "00" after period*16;
    parallel <= "1010";
    sdr <= '0';
    sdl <= '1';

   

end arch ; 