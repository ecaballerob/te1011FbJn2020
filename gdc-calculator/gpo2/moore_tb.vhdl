library ieee;
use ieee.std_logic_1164.all;

entity moore_tb is
end entity;

architecture arch of moore_tb is
    component moore is
        port (
            timer : in std_logic;
            s     : out std_logic_vector(1 downto 0)
        );
    end component;

    signal timer : std_logic;
    signal s : std_logic_vector(1 downto 0);
    constant period : time := 10 ns;

begin
    UUT : moore port map (timer, s);

    process
    begin
        timer <= '0';
        wait for period/2;
        timer <= '1';
        wait for period/2;
    end process;

end arch;